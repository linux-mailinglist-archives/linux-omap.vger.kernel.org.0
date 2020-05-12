Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5CF81CF5FE
	for <lists+linux-omap@lfdr.de>; Tue, 12 May 2020 15:40:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727859AbgELNkN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 May 2020 09:40:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727783AbgELNkN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 May 2020 09:40:13 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6534C061A0C
        for <linux-omap@vger.kernel.org>; Tue, 12 May 2020 06:40:12 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id a21so13658257ljj.11
        for <linux-omap@vger.kernel.org>; Tue, 12 May 2020 06:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=Pp1+s7RQ5rG8lY+v9K4jMvguVWgg1aIN5RkE+DwswEc=;
        b=N22OoGtlhpGWtcLQ/0KkDG42g9u3knwLq1ysGrc5E1jwvHDqwmfheeLOnOtbR8rlky
         hDaHSWVmugcxRKfSpJ5YsOtxYzLW54HNHGpdz611Q8rqG9t/fPFSfE/tvQyT7Sfq1ZSi
         csfhGnovFYhI3j7c/WrYhiC1AiiDBXFK3xYvI7cd1c/4zZw7p+G3CYC+PyNugoNDbuTI
         FvYto0BlpX/ZerPafocwEA9ElzYBO+cdHppyEWi46OMjFYB6BKP7JPdyU2kDyByJaxNL
         TSF1tMEuQ/wRpOBUBol4hXkxIblO1oTRQGw8GMjxiEEaIr9DFRg8VzCgp63E1Fr8+FiF
         ES6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=Pp1+s7RQ5rG8lY+v9K4jMvguVWgg1aIN5RkE+DwswEc=;
        b=Y/D5Ky8Hh2h2vCkpapLfEbD4rZi0snq1HQF/84lxJ/C8iQ7p/3P/6HWBSnOk8omw6n
         zlkj7RABdqsf9Hj7PQyVkKVxqLprqjWlWyJGvJSxFMc4I0yGmgMv3mj4Mv/Qojn3gMg0
         53ejJycXiMQaeGAvHApXCO+t7019/XGsxFqBrj4mXGCKL4JheySXEwl9M4sPMpQWMXIa
         g/saAOfm+gobD5BnFqm5Xx7DQP/aNCLPrbCT1vdWThq2bRfbAkjJ4/VWhxV6L0PVH0Ul
         aECEAFie0ehGzpet4z1q6bipdX/gHr1sOUMitkxvNymJiNQcqB82PCmegejJLs2SYlX7
         Oz8w==
X-Gm-Message-State: AOAM533mbsYskOTNNh2IJ1exu4AVtSyO8RkDL7Hio8OtjZjYkMM3opuJ
        kESCK7UNM9wLDoSZywOjtpPJMzuGAWQ=
X-Google-Smtp-Source: ABdhPJygnuUfP3AqRdEt3f3LbzrFqpyjkI6P2lMv5ZSqQsXoxYAC3dAsORVRiAneM35SkAruG/PnSw==
X-Received: by 2002:a2e:584a:: with SMTP id x10mr3773902ljd.181.1589290811059;
        Tue, 12 May 2020 06:40:11 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id c2sm12916459ljk.97.2020.05.12.06.40.10
        for <linux-omap@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 May 2020 06:40:10 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     linux-omap@vger.kernel.org
Subject: Re: BBB with v5.7-rc5
In-Reply-To: <87k11h4df0.fsf@kernel.org>
References: <87k11h4df0.fsf@kernel.org>
Date:   Tue, 12 May 2020 16:40:06 +0300
Message-ID: <87eerp46h5.fsf@kernel.org>
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

Hi,

Felipe Balbi <balbi@kernel.org> writes:
> what's the trick to get BBB to boot recent kernels nowadays? :-p
>
> I'm using omap2plus_defconfig without CPSW (doesn't link otherwise) with
> GCC 10.1.0 (I'll try an older version shortly). Cmdline is the usual

same result with 9.2. Nothing from low level debug either.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl66pzYACgkQzL64meEa
mQaOfA/+MpMlAzhLvVFdWBMniJu1tHtK7RmPWGnk8UzmcOgUGYYdVRTmvRp6zTXA
paNAFS/9GEsP0n+3QLSbRyn4vZhk4Z30JR/dEOH6BZ3mCuYxgex6cieaSWnFdhF6
MiC4qv830FHSXFoV06u+rZuZU4P0k5UqHJ3MrZjZSNgVpV3+j3r0x5yFvH+wJOak
wmJf6AbHbQqpbX2Ws72GEhO3nWSBKbBgryNKbHv4PvTnAgnJqEqK+5EHvE/gEEFM
oegf6sCu+dCtqKXafilB2tvcDLLnCcJs3PmrCnl1sTOC2AnZDAOSdJMXKmazrw7x
CZ9/Q2P8vL4987lFzUnCTIYLUjEdTnCVj14Hvs+GNDwfrm+sel+KB7unQGopww5l
aieX1Oe78s9Je2xarC8r1N6ZHcC53NJWKFhoF2y1BPaPgb6yJOLfvJniVWeVCpWv
QmCSE6q6JyAtOI25TWNNq1llSKRVzn+jDllAeomvlw/fRBz4UaTAfrMqpGVS4nHt
WiZObxXIypW/4BaVuA2+LHB2vmVy81AJti45B+NF4PqRL8EXVYUfHr35pjXhdWyI
aNVe5Wvgnp6zyKuAH87xbdAm3fk6t7l/R9SsuBX1L0xKvblHEtLpFMTHcC6etEei
vJjmEQgdmr6XJRLqt1y7iTdgTlRw+qP9Lv0W2eCa90dc/AxD7p4=
=BvFJ
-----END PGP SIGNATURE-----
--=-=-=--
