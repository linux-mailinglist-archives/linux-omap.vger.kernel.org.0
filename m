Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC58A262365
	for <lists+linux-omap@lfdr.de>; Wed,  9 Sep 2020 01:08:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729212AbgIHXIy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Sep 2020 19:08:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726683AbgIHXIw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Sep 2020 19:08:52 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B6B4C061573;
        Tue,  8 Sep 2020 16:08:52 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id t7so360875pjd.3;
        Tue, 08 Sep 2020 16:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=nhMCTOALn672JsDL84Wj+xI2dlHy5wjJXdxUYt7OHzg=;
        b=ZOW49ACbJzMum5GJrno6aQTnVf5c1Et9rUJClK9Ttk7wQgxb2pga35evfHcF18WRBn
         +moz19JmlvB5Mh7QSN00gt+CfpENnZC0SuliDKIWc0zFWzKUUQoawqHDlyl7XCI0Y+3y
         zty2iR0WJTY47Thx5XORc/PDpTfvwJMnyg9JB8tN5edKgNUC1yx8al287X9cGG9CLPLG
         srNNomnxVWx+th5pnOPoW6uQVmVZIj3d0opjPhI59JTSrLi26Cp4uS0goOjNwd2su19E
         ewuv3VWbcoJplrT6AaXul62aeMa7iGcvXAAjkqknCLFFctkdL5FE4/LYZ2zrMAusTZ4f
         3XnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=nhMCTOALn672JsDL84Wj+xI2dlHy5wjJXdxUYt7OHzg=;
        b=rekloVaCkf2Q3GHZ82NtZ5aIUTmwPmErpXCl+8FYsR8updtjcRTsLeISdeER3PpeZt
         tD+JDV0XKhk8mQhrWOydVGDZUWKbUg8OTSxoJxBMXJ4AYgWd95JsooA/Chj21PW8G0PY
         BL7V8jwqyjzgtlZw52J9zO6z1qefo7mDelcIHWiM5XmgXxDQHciyRjFCgSXSBvVkS3WC
         a9HftW2fk+32RToZsHleZVj0Rkch77oxb3h6+mjlmtDie/HBon4NbglHsqBLqvsI1L+K
         gJWRL8TIJxo+t+LKCXvW7JuYpYNIJ+TmHt+AXkuLBZsDo8RV3/vV3yRppwBamL/tbIJ/
         MJSg==
X-Gm-Message-State: AOAM532ddRHnBAh7kPNLEpKGrFvivKdtfInFlt50btyId2r7RJZ9NZqb
        TJxym449ItauE+qxJuUVjJ0iIxmbYxlv1Q==
X-Google-Smtp-Source: ABdhPJz23MFGOATYEMVraf03YziCv4dF3U9WbMysUq3I3GzsltCXa+NL7T4xkSSXR4i0b/yXWbX2pg==
X-Received: by 2002:a17:90a:e391:: with SMTP id b17mr988444pjz.127.1599606531764;
        Tue, 08 Sep 2020 16:08:51 -0700 (PDT)
Received: from Gentoo (sau-ff5be-or.servercontrol.com.au. [43.250.207.3])
        by smtp.gmail.com with ESMTPSA id 64sm439142pfz.204.2020.09.08.16.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 16:08:50 -0700 (PDT)
Date:   Wed, 9 Sep 2020 04:38:33 +0530
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, tony@atomide.com, sre@kernel.org,
        nekit1000@gmail.com, mpartap@gmx.net, merlijn@wizzup.org,
        martin_rysavy@centrum.cz, "David S. Miller" <davem@davemloft.net>,
        guido.gunther@puri.sm, konradybcio@gmail.com, arnd@arndb.de,
        martin.botka1@gmail.com
Subject: Re: Mailing list about low levels of Linux on cellphones
Message-ID: <20200908230833.GA27644@Gentoo>
Mail-Followup-To: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, tony@atomide.com, sre@kernel.org,
        nekit1000@gmail.com, mpartap@gmx.net, merlijn@wizzup.org,
        martin_rysavy@centrum.cz, "David S. Miller" <davem@davemloft.net>,
        guido.gunther@puri.sm, konradybcio@gmail.com, arnd@arndb.de,
        martin.botka1@gmail.com
References: <20200908225610.GA25399@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ikeVEW9yuYc//A+q"
Content-Disposition: inline
In-Reply-To: <20200908225610.GA25399@duo.ucw.cz>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 00:56 Wed 09 Sep 2020, Pavel Machek wrote:
>Hi!
>
>It seems there is quite a lot of efforts porting kernel to various
>cellphones.
>
>Librem 5 and PinePhone have their own hardware, people around Maemo
>Leste work with Nokia N900 and Droid 4, there's group working with
>Sony cellphones, there are postmarketOS people and there are probably
>groups I don't know about.
>
>I believe some coordination would be useful, so we end up with
>compatible solutions for various problems.
>
>It would be also good to know how ther hardware is progressing. I'd
>really like to have phone I could use as a _phone_, running mainline
>kernel. So far N900 with original Maemo is closest I could get.=20
>
>Would it be possible to create a mailing list on vger.kernel.org?
>Probably phones@ or phone-devel@? I believe it would be useful to
>cover hardware-dependend pieces of the phone stack (ofono,
>modemmanager) as well as kernel.
>
>Best regards,
>
>									Pavel
>

That's sounds good and people will have clutter free mailing list of specif=
ic
thing. The other side would be to have little maintenance headache to maint=
ain
that list.=20

But , it is a good thought!

Thanks,
Bhaskar
>--=20
>(english) http://www.livejournal.com/~pavelmachek
>(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/bl=
og.html
>

>-----BEGIN PGP SIGNATURE-----
>
>iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX1gMCgAKCRAw5/Bqldv6
>8hCjAJ0UUeO25TWORFOuDeLu9eryN7BzAACfeQaxgX1aqhy1aTcgrIOawZWdz6w=3D
>=3D63wl
>-----END PGP SIGNATURE-----

--ikeVEW9yuYc//A+q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl9YDu4ACgkQsjqdtxFL
KRXinggAiI7J6DlsPHBgxYGdKNikkcZEkiCiMkA+fkgtSOwO3xbfedPyjXgTOMfx
b9nhdRpooEieEtOog88dsCD5j/CMD3PUR+j99zoFoJxoDN6yTrhgPhL8HMYGt1+a
DRPAhuJ0v9i4cXPevDYtXUO5Uh8ipwHgl0KPTxp/TzfImEsZZMBB9KmFA28uyEam
BmMvxfpF93TgXA/phnupsvPk8FzhZl7y049VecjJtvi1IumsbeV9MdeLInDuW/8i
Z/J1qbqVNNrmuWBEeDtX+Xz8vhFIcIxVbrFIsCANdh7yiDsuAtWcJ+NjLv4xa28Z
RLwQjagUgOEepJRB7lprN9MokT+0sw==
=qhhi
-----END PGP SIGNATURE-----

--ikeVEW9yuYc//A+q--
