Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E24681CF318
	for <lists+linux-omap@lfdr.de>; Tue, 12 May 2020 13:10:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727783AbgELLKV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 May 2020 07:10:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726891AbgELLKU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Tue, 12 May 2020 07:10:20 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B0EDC061A0C
        for <linux-omap@vger.kernel.org>; Tue, 12 May 2020 04:10:20 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id x73so10213880lfa.2
        for <linux-omap@vger.kernel.org>; Tue, 12 May 2020 04:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:subject:date:message-id:mime-version;
        bh=hmIl6+KawqLnd4VXZfotIUMImuwWAy9Eypa4OM2Sq5M=;
        b=ZwzKUSP5Hksxc81xq6vvP/2dX3R3Gr6nk3ApI4eSr/fyzS8yQchmYsIOYm3AZV6g9o
         3zNaWgTsfnIkGhDF2925FsjcF38GU6RrQBjBtUBaN+fiOqELxButF4K4nsejshp3jWSq
         cePphxbSXeJZPwpzyIoDwj8Q8PTytKgTK7LxDjBxmWm7dPwZj9EybIo09e7H4CIbX29P
         Cw5j+EWSgx+bG/gasC7cqsh7Usc7b/xomujUk3dmbWsX4hHGIKAVKl13Alrv0+SB/I/x
         /Eurznq1st39RuRgsyP03gl6jhaCaRgNxa7aUtnGvXDQ+lFdT2PASU5d5ao3yI3OA0ci
         g6Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:subject:date:message-id
         :mime-version;
        bh=hmIl6+KawqLnd4VXZfotIUMImuwWAy9Eypa4OM2Sq5M=;
        b=ihEo9nP1ZzgbeCy5nqgTHOpAX5XGHOFEQIWboN4mLnMmpkj4D0c30HWVmXqaBzgtDe
         LrcfsLESxp7p4EEI/AwjKP58zTL2joexf48Bpb/Wzw/mf9uOx0LRKl1GR812p8QwaTw3
         I4M1G1WUHgA+heiTYjIVKKced8Bu+Dsp4WGSzUNwpCDCpegobqgfJxx9hmYXH+tbqbeJ
         BbxxanpYVq83/f7m0Od62hyOMFkZH2ycEp7dN/8fQnF5xfslDrHPa1F5C4xlbSNSxq/I
         dF19zGNHJOkV3tkd992H1NOeo+J8oHqOY4lUxP/7gSATkzHuXz9S+pTtR1AIQurgm0FE
         YqVQ==
X-Gm-Message-State: AOAM5308oFtxeibUvIShBfDjacBnPOe6zIEZEE2SkA/Pmc2+I8ji3HZs
        +7TzVsTCWopv+UOpWFSY6Z43fU00w5o=
X-Google-Smtp-Source: ABdhPJyoK/0hqB/gcg1mcatrhZOonMXeuLPkvkdfbLCmiTgsVbmltC0oAFI5TilJSX/Yb/wWFMcUfQ==
X-Received: by 2002:ac2:4436:: with SMTP id w22mr13995229lfl.55.1589281816874;
        Tue, 12 May 2020 04:10:16 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id j21sm11912029lja.2.2020.05.12.04.10.15
        for <linux-omap@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 May 2020 04:10:15 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     linux-omap@vger.kernel.org
Subject: BBB with v5.7-rc5
Date:   Tue, 12 May 2020 14:10:11 +0300
Message-ID: <87k11h4df0.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi guys,

what's the trick to get BBB to boot recent kernels nowadays? :-p

I'm using omap2plus_defconfig without CPSW (doesn't link otherwise) with
GCC 10.1.0 (I'll try an older version shortly). Cmdline is the usual
root=3D/dev/mmcblk0p1 rootwait console=3DttyS0,115200n8 (also tried ttyO0)

I get nothing on serial console. Has anyone tried a recent kernel on
BBB?

Cheers

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl66hBMACgkQzL64meEa
mQbi0g//TFpmFBc4Un6+Erb4JPACFO+I2w6Gb6Qg2/of8YUBt/SuLf20R2hbAQde
GohBaNU4XzMhcw5m49G/x9Gdi5WdNTBd6BVgbj76+G7YrTR1PKjQttDzYpvPAFT8
PisoBt7/kpMisPPgj4RQrHaJ1S44z/u3x56Xpu1k81pFOFsOw6ZFUKvhFP5d58XG
XQC81nxPrufePEkfnfqv7L5ibtJlRkqR3bgHypVdaYIWheqtOxnYa4fxnfnOHCB2
mIrZ5q7PG7CLqNe4fKH2V6Xx8eyTgLP3EGx+sD4/Yf7do6HMqqIbifjNX2mWHXE5
1QmaUNaxfuZjoaVlMLpMekZtUcC1pQA9KUcdVjU/xiTo+dapwMd5S0Xx3jlN7mv9
2q3j5IXlrILXkNGMRfhBZ5PHAvayVtDoKSf0zMkz06s05JryzLN2o0MNYBYlSQOU
3EkjLE82miLspyXFObX82yQM1TEHVKdLtTeTUD6dWatP74LVaN8ZqjSdiyntrtTf
oEtSE8HJDnP9m9l528BZHea2Pv3xQADpgWXVlRi7ggwoNEnM98M5Fmi6pViVlHMt
1KQ4Ido5ftccwyqHk1Ig4gb5JDYEZ7saX+AyaI+eoe/RPCQsG+DUbSTfd4U9iTEG
Jvpyn3A1jDtyxZ8qzJk7MLSpyAN+csR/roji0tfzIU6LR+djv5U=
=9MCD
-----END PGP SIGNATURE-----
--=-=-=--
