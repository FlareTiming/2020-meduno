#!/bin/bash

mkdir json
curl -X GET -H "Accept:application/json" http://localhost:3000/swagger.json | jq > json/swagger.json

mkdir json/comp-input
curl -X GET -H "Accept:application/json" http://localhost:3000/comp-input/comps | jq > json/comp-input/comps.json
curl -X GET -H "Accept:application/json" http://localhost:3000/comp-input/nominals | jq > json/comp-input/nominals.json
curl -X GET -H "Accept:application/json" http://localhost:3000/comp-input/pilots | jq > json/comp-input/pilots.json
curl -X GET -H "Accept:application/json" http://localhost:3000/comp-input/tasks | jq > json/comp-input/tasks.json

mkdir json/task-length
curl -X GET -H "Accept:application/json" http://localhost:3000/task-length/task-lengths | jq > json/task-length/task-lengths.json

mkdir json/gap-point
curl -X GET -H "Accept:application/json" http://localhost:3000/gap-point/allocation | jq > json/gap-point/allocation.json
curl -X GET -H "Accept:application/json" http://localhost:3000/gap-point/validity | jq > json/gap-point/validity.json
curl -X GET -H "Accept:application/json" http://localhost:3000/gap-point/pilots-status | jq > json/gap-point/pilots-status.json

mkdir json/fs-score
mkdir json/as-score
curl -X GET -H "Accept:application/json" http://localhost:3000/fs-score/validity | jq > json/fs-score/validity.json

mkdir json/stats
curl -X GET -H "Accept:application/json" http://localhost:3000/stats/point-diff-ft-as | jq > json/stats/point-diff-ft-as.json
curl -X GET -H "Accept:application/json" http://localhost:3000/stats/point-diff-ft-fs | jq > json/stats/point-diff-ft-fs.json
curl -X GET -H "Accept:application/json" http://localhost:3000/stats/point-diff-as-fs | jq > json/stats/point-diff-as-fs.json

mkdir json/fs-route
mkdir json/fs-mask-track
mkdir json/fs-effort
mkdir json/cross-zone
mkdir json/cross-zone/track-flying-section
mkdir json/tag-zone
mkdir json/peg-frame
mkdir json/peg-frame/track-scored-section
mkdir json/pilot-track
mkdir json/mask-track
mkdir json/land-out
mkdir json/discard-further
for t in {1..4}
    do
        mkdir json/fs-route/$t
        curl -X GET -H "Accept:application/json" http://localhost:3000/fs-route/$t/sphere | jq > json/fs-route/$t/sphere.json
        curl -X GET -H "Accept:application/json" http://localhost:3000/fs-route/$t/ellipse | jq > json/fs-route/$t/ellipse.json

        mkdir json/fs-mask-track/$t
        curl -X GET -H "Accept:application/json" http://localhost:3000/fs-mask-track/$t/arrival | jq > json/fs-mask-track/$t/arrival.json

        mkdir json/fs-effort/$t
        curl -X GET -H "Accept:application/json" http://localhost:3000/fs-effort/$t/landing | jq > json/fs-effort/$t/landing.json

        mkdir json/fs-score/$t
        curl -X GET -H "Accept:application/json" http://localhost:3000/fs-score/$t/score | jq > json/fs-score/$t/score.json
        curl -X GET -H "Accept:application/json" http://localhost:3000/fs-score/$t/validity-working | jq > json/fs-score/$t/validity-working.json

        mkdir json/as-score/$t
        curl -X GET -H "Accept:application/json" http://localhost:3000/as-score/$t/score | jq > json/as-score/$t/score.json

        mkdir json/comp-input/$t
        curl -X GET -H "Accept:application/json" http://localhost:3000/comp-input/$t/pilot-abs | jq > json/comp-input/$t/pilot-abs.json
        curl -X GET -H "Accept:application/json" http://localhost:3000/comp-input/$t/pilot-dfnt | jq > json/comp-input/$t/pilot-dfnt.json
        curl -X GET -H "Accept:application/json" http://localhost:3000/comp-input/$t/pilot-dnf | jq > json/comp-input/$t/pilot-dnf.json

        mkdir json/task-length/$t
        curl -X GET -H "Accept:application/json" http://localhost:3000/task-length/$t/spherical-edge | jq > json/task-length/$t/spherical-edge.json
        curl -X GET -H "Accept:application/json" http://localhost:3000/task-length/$t/ellipsoid-edge | jq > json/task-length/$t/ellipsoid-edge.json
        curl -X GET -H "Accept:application/json" http://localhost:3000/task-length/$t/projected-edge-spherical | jq > json/task-length/$t/projected-edge-spherical.json
        curl -X GET -H "Accept:application/json" http://localhost:3000/task-length/$t/projected-edge-ellipsoid | jq > json/task-length/$t/projected-edge-ellipsoid.json
        curl -X GET -H "Accept:application/json" http://localhost:3000/task-length/$t/projected-edge-planar | jq > json/task-length/$t/projected-edge-planar.json

        mkdir json/cross-zone/$t
        curl -X GET -H "Accept:application/json" http://localhost:3000/cross-zone/$t/flying-times | jq > json/cross-zone/$t/flying-times.json

        mkdir json/mask-track/$t
        curl -X GET -H "Accept:application/json" http://localhost:3000/mask-track/$t/reach | jq > json/mask-track/$t/reach.json
        curl -X GET -H "Accept:application/json" http://localhost:3000/mask-track/$t/bonus-reach | jq > json/mask-track/$t/bonus-reach.json

        curl -X GET -H "Accept:application/json" http://localhost:3000/mask-track/$t/bolster-stats | jq > json/mask-track/$t/bolster-stats.json
        curl -X GET -H "Accept:application/json" http://localhost:3000/mask-track/$t/bonus-bolster-stats | jq > json/mask-track/$t/bonus-bolster-stats.json

        curl -X GET -H "Accept:application/json" http://localhost:3000/mask-track/$t/arrival | jq > json/mask-track/$t/arrival.json
        curl -X GET -H "Accept:application/json" http://localhost:3000/mask-track/$t/lead | jq > json/mask-track/$t/lead.json
        curl -X GET -H "Accept:application/json" http://localhost:3000/mask-track/$t/time | jq > json/mask-track/$t/time.json

        mkdir json/land-out/$t
        curl -X GET -H "Accept:application/json" http://localhost:3000/land-out/$t/effort | jq > json/land-out/$t/effort.json
        curl -X GET -H "Accept:application/json" http://localhost:3000/land-out/$t/landing | jq > json/land-out/$t/landing.json

        mkdir json/gap-point/$t
        curl -X GET -H "Accept:application/json" http://localhost:3000/gap-point/$t/pilot-df | jq > json/gap-point/$t/pilot-df.json
        curl -X GET -H "Accept:application/json" http://localhost:3000/gap-point/$t/pilot-nyp | jq > json/gap-point/$t/pilot-nyp.json
        curl -X GET -H "Accept:application/json" http://localhost:3000/gap-point/$t/validity-working | jq > json/gap-point/$t/validity-working.json
        curl -X GET -H "Accept:application/json" http://localhost:3000/gap-point/$t/score | jq > json/gap-point/$t/score.json

        mkdir json/cross-zone/track-flying-section/$t
        mkdir json/tag-zone/$t
        mkdir json/peg-frame/track-scored-section/$t
        mkdir json/tag-zone/$t
        mkdir json/pilot-track/$t
        mkdir json/discard-further/$t
        for p in {101..134}
            do
            curl -X GET -H "Accept:application/json" http://localhost:3000/cross-zone/track-flying-section/$t/$p | jq > json/cross-zone/track-flying-section/$t/$p.json
            curl -X GET -H "Accept:application/json" http://localhost:3000/cross-zone/$t/$p | jq > json/cross-zone/$t/$p.json
            curl -X GET -H "Accept:application/json" http://localhost:3000/tag-zone/$t/$p | jq > json/tag-zone/$t/$p.json
            curl -X GET -H "Accept:application/json" http://localhost:3000/peg-frame/track-scored-section/$t/$p | jq > json/peg-frame/track-scored-section/$t/$p.json
            curl -X GET -H "Accept:application/json" http://localhost:3000/pilot-track/$t/$p | jq > json/pilot-track/$t/$p.json
            curl -X GET -H "Accept:application/json" http://localhost:3000/discard-further/$t/$p | jq > json/discard-further/$t/$p.json
            done
    done
