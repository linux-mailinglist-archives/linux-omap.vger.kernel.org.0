Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65E1F1CF632
	for <lists+linux-omap@lfdr.de>; Tue, 12 May 2020 15:53:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730110AbgELNxA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 May 2020 09:53:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726891AbgELNw7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 May 2020 09:52:59 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B98AC061A0C
        for <linux-omap@vger.kernel.org>; Tue, 12 May 2020 06:52:59 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id h4so13727654ljg.12
        for <linux-omap@vger.kernel.org>; Tue, 12 May 2020 06:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=CmkGgh2Jbibiome4ZDKep05f3xmOLWNsBxxss5kVai8=;
        b=fKDXWmoNPP+WX1ez7FLtTIHEOsyLxjTkoUVBMnhro8kwAK1e3X9RXK+Sk99mybt1Mh
         wWpJ9XPCTzScTWZtnJ2PR000lHvQmjNpFf7fYWLrnFlp7J1LtTf7TOHzdx5PMsk/wVPt
         bKUj6R6SMCDLPKae+oH9IKt5ucY4Jw7gx6c/N/rm8Pvr784GcZVPrrSIHGzglJGHbIbS
         qGiyGt7awj1O5b7CsAkXBgfSQWgXpl0yxHMx19FCyV5cIWnFekycAfSFZXf38ioK8Gbm
         boHt+Pp+XTsnXroeIixFLzaDDTD8EythVCBNNLvx13sajcKWVWCxReW/t28l4WurUdT8
         bkNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=CmkGgh2Jbibiome4ZDKep05f3xmOLWNsBxxss5kVai8=;
        b=jhoMFibiem4JvUpGDzemQ3deyDixb4ybWkeJqIpdIdZDL710IHrBiXkZBHU7BpxrRT
         fdproJGcMqkcAUONsutj1i1JsgWcT+/xtffd+ObJYY0noJeFDtfz9yetZJElVzXTgRk2
         qRdBkNq8gX1iLPugicn49YVN/SlHbWuTwEKSVyLItheeMEPaSnBN0jCkaOy/OcO51eoA
         YQnSCRNJujeITYLqtQmDvn+hTMMqaKjfuabj0HiZI88AlrwASK8rhy/2a2ewQLugWxu2
         ZNgQcRoLjh23naR94YGmCya4X6qApm+jIsrSWNf74onU9HC/4CzTOzIDF7U0F7sRhalF
         /ApA==
X-Gm-Message-State: AOAM532eEEHlmp5ziqGWe2/npgqHrM+lOqsj9T2nCBVqZC22YibpYRMZ
        CN/9ti1c+k91jlQHL+/XVhDsbWmHk2g=
X-Google-Smtp-Source: ABdhPJwVQLpLUsrRe542BY72cqb2M7VAdbVxAnmtqw6nfg2qloOKp4p7XQwIEj1PtMkUbfxpAt53mw==
X-Received: by 2002:a05:651c:1b9:: with SMTP id c25mr9804535ljn.285.1589291577628;
        Tue, 12 May 2020 06:52:57 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id c79sm14353714lfg.29.2020.05.12.06.52.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 May 2020 06:52:55 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Dan Murphy <dmurphy@ti.com>, Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org
Subject: Re: BBB with v5.7-rc5
In-Reply-To: <586c35cf-80f1-6922-a46b-a6fce312e83c@ti.com>
References: <87k11h4df0.fsf@kernel.org> <87eerp46h5.fsf@kernel.org> <20200512134648.GD37466@atomide.com> <586c35cf-80f1-6922-a46b-a6fce312e83c@ti.com>
Date:   Tue, 12 May 2020 16:52:51 +0300
Message-ID: <87blmt45vw.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hi Dan,

Dan Murphy <dmurphy@ti.com> writes:
>>> Felipe Balbi <balbi@kernel.org> writes:
>>>> what's the trick to get BBB to boot recent kernels nowadays? :-p
>>>>
>>>> I'm using omap2plus_defconfig without CPSW (doesn't link otherwise) wi=
th
>>>> GCC 10.1.0 (I'll try an older version shortly). Cmdline is the usual
>>> same result with 9.2. Nothing from low level debug either.
>> Maybe check you have a current dtb file? The older dtb files may not
>> have all the needed data.
>
> I have been using the latest uBoot, DTBs and kernel with no issue=20
> (except CPSW).
>
> I have booted the BBB and a BBG.=C2=A0 9.2 gcc compiler

I'll give it a shot. Maybe it's something silly I did along the way ;-)

It's been a few years since I touched ARM :-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl66qjMACgkQzL64meEa
mQYG6hAAqFhOB/cbBfJ9tCGSVe67WuElq4NMElGw069XmlRhMEj/9g9GmpthEVi4
u1x4NAleRD5/s8PJMyAWGaum48iSgApWUgzOE3mald5d6dbXNBkNhLti4N/q38re
GcLUWL8vmvbt/yEla1yue29q5un2CQ4vtUuboWiLA5bIzOkuG3o4kBUUWt220LBj
VxntwJrDbXtxbiEkvNsx79UD5NGgC7X2LzYx4rHUpeIhGWmLViWgsELXXfhY1Oxh
mgBccIXgXAsZy/kMgpYHgPEe0BFJwO3UpOVtw2XI/hWQupPkjb2X2tjeqNGhAO09
LNIkGXwdRiLGzG+wVfDj22KMrkwMjp19Jr17RIzvtcZjhHpw99ApLva8a4BOcVsE
vmWO+Jy8nmVtAWL8VJqxawtDsX0QQ7u6h98PvzA7TfOMDKaMCBhZZhHzWdN3ybyh
qSPNwFbd7kP8eKHVboaaaYA9Yg9XgbMrgYuWrtdbZ4/Hx6SelBOljEWG+sqeYUZl
CNtduB7zvVZ7HA2GBVN5T1njuDeiyzAaJNNCQ7l8CPL33KDMNFk5WKNroDPx3fTt
iwk0MOZX8bxGpmxNKkY3NRy32/IHNXuz8GY6FRtI/LrPqNhQ0ZRBYoQycdr9NNj5
M5I+yOG6NqrHABB/qgmeGVTKQRtTi14/RvjvPuZjzxdLniXSV5s=
=pqPr
-----END PGP SIGNATURE-----
--=-=-=--
