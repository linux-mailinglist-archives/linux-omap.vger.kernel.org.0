Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BC851CF945
	for <lists+linux-omap@lfdr.de>; Tue, 12 May 2020 17:34:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730750AbgELPeA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 May 2020 11:34:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730636AbgELPd7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 May 2020 11:33:59 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B22EC061A0C
        for <linux-omap@vger.kernel.org>; Tue, 12 May 2020 08:33:59 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id u20so3872094ljo.1
        for <linux-omap@vger.kernel.org>; Tue, 12 May 2020 08:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=mOP/Ft6cI0hdIumlv9ctKfSS43C7gS2VvrrEhU+vEvE=;
        b=Z8lD3wIX7DKw05x+RfD3/tegPr5zHQn6JLsFvQ09MM6JnlVnN4+rXOApeiNXpuCFLU
         kVS6DOC0qYb9+J+CuVpD3mDIq97s2qJAYQZQgAAMjQcqPs8ddxcynADpx4kw1l2v9llL
         q54lK9fM2TGzkqa1NM3fgK0o/Mqro0OM8xaZcGycYlmfmkMQIN+MZgQDpHsM8AyRUijS
         jHJ7yhDxxn9Hw9dOegMDlfcgTJcXsH783YKHDmzwbs/wPxGaoltwNYXe9WK4FS+umJaX
         bceNsGnjXW3AnWNDvOCrCGAu19h/WMw8Nzr4R5dkvEnhI8mf5IHjAmuaQptHiDZ6Lhf4
         N1oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=mOP/Ft6cI0hdIumlv9ctKfSS43C7gS2VvrrEhU+vEvE=;
        b=JLd4pFje8OyJtmuei131UpeUzuY6T43VUDV8INBJkiAmgHJyTnYaLGUqJOUMcBBtS9
         5EH5RLoL197NNx+FoxSXLiExKAVPRx/83dUNn659YSORY72qj32sVGCly1mSKKA1riIC
         Gfy5r4tvp/8LelEql3W3Las37esDcSmosjXeElm7sHeOrzLw7PjOtIKGBK48BPIF2LnV
         AxJ2wowtae2KIpxXlFSutjkj2DEWRYIeTDI4DOZ3LCTJFgGi3N2eRAS+M8YTurOm90TR
         dQWqgnL09OFjDPSg/aMTnlgtyOebBrPmdF6YOVhCAAk3OuoADOSwrqCi4tzAzinSFvzW
         8zJQ==
X-Gm-Message-State: AOAM531guuh7WYqW6blTsMyDmWgrnUgoNdoxg1mbe2swUSurPtVtmwkX
        FXSnaXLVNdkb/2xavh9wbnIaj6i4vjY=
X-Google-Smtp-Source: ABdhPJyEmsIz6n0BrgAm/XcFPEwMOOHzcNhQtUTfM4SLxUE3J9/2FPwtZKke7FHTtIfPtDQMBZxe3Q==
X-Received: by 2002:a2e:780a:: with SMTP id t10mr14120879ljc.247.1589297637722;
        Tue, 12 May 2020 08:33:57 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id a15sm12936197ljb.37.2020.05.12.08.33.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 May 2020 08:33:56 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org
Subject: Re: BBB with v5.7-rc5
In-Reply-To: <878shx45r8.fsf@kernel.org>
References: <87k11h4df0.fsf@kernel.org> <87eerp46h5.fsf@kernel.org> <20200512134648.GD37466@atomide.com> <878shx45r8.fsf@kernel.org>
Date:   Tue, 12 May 2020 18:33:52 +0300
Message-ID: <87o8qtp3q7.fsf@kernel.org>
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
> Tony Lindgren <tony@atomide.com> writes:
>>> Felipe Balbi <balbi@kernel.org> writes:
>>> > what's the trick to get BBB to boot recent kernels nowadays? :-p
>>> >
>>> > I'm using omap2plus_defconfig without CPSW (doesn't link otherwise) w=
ith
>>> > GCC 10.1.0 (I'll try an older version shortly). Cmdline is the usual
>>>=20
>>> same result with 9.2. Nothing from low level debug either.
>>
>> Maybe check you have a current dtb file? The older dtb files may not
>> have all the needed data.
>
> yeah, loading all the data from sd card. I am, however, using the u-boot
> that came with the board.

All sorted out, thanks for the tips ;-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl66weAACgkQzL64meEa
mQY/wBAA2Sc203FLR5fnFQ3G8ab96zK7ojk6B3cvQGqfnB/UpbYEVwt4+SDFffPy
NhKREVP3BwBOxXhr2lb+F079HK9QzfgXtgy1jAHrP7fJwUBVCewk+O/9DXWtnhi4
bYoyx48WK2m5n8B3+k7hx7xMWHbJ1csF2IcfwJL1vlOeE2vrvBVBT9wyZbPq11PX
LJT07Crqk7y5BM28pGfl16CRu6Siiq6W8tT3poINy9E6hPX5lbU0XKhwTMOemCPE
3e/7y6VxCw9vY36nK/GMJcob9ArjZJkpXNpoUtLpYspxW0TVue3+wBPy76mNmsqj
tYtyC/Gh/qyJxZdLrLZLAoiH6/RxHLOJyWQ2JrpWhKqYgY6zPUnTjVtYPWxd00bu
Alm+XdEJkGNVkQmpm7nk/dYByZ0zDWZYAh5bHsROkXuqjN9i0rulkkF/PAiPiShU
PWhDykDhvWX0TlPbAOoORQgy1t0vTsRbCyYS7Adz2fKukJtCZJ9O2QTje5sD24am
P5nL5Z81Y2HO6L5CDVBggx52LgHOoOW2vy7tuQOs80TOMbne0xOnBwWo3mxwtjeN
29K8tJ/bU98RU2qj2o771xFZmVgCj99AIy9B1rE+Zx9nMSWFj9MQbp8isgLHepSD
IBcTJkZRgG30SlgWX5xWT+UNgF2WV177XcearhAaeXlGRbtqDrs=
=I7eK
-----END PGP SIGNATURE-----
--=-=-=--
