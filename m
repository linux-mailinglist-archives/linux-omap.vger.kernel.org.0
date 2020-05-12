Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C8311CF63E
	for <lists+linux-omap@lfdr.de>; Tue, 12 May 2020 15:55:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729583AbgELNzu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 May 2020 09:55:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729336AbgELNzt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 May 2020 09:55:49 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D90FCC061A0C
        for <linux-omap@vger.kernel.org>; Tue, 12 May 2020 06:55:47 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id h26so10644059lfg.6
        for <linux-omap@vger.kernel.org>; Tue, 12 May 2020 06:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=ieDMAA9yb+riKiWlcn1PcAR1xXEldRWacm/9O7wTeN8=;
        b=nqHi0lvEre8nnaYlAJI9c4SegL2WtVHhZudtG9rI2YK7JHpGjZWmVfz4Xj+TxFItCm
         jV82jyzvEuuqJTPnnCd/u4OUkKNkhFMy0q7jhtLHmHAiOLz0bOUmwjLyv8qv/r3IE/+d
         vMEg4ad1K8SN01wPDvDyc52jYm9FYqw7r5vRiwPkPQEKLsGReqbqnmZGj9ElFenZIl0Q
         foLfjZprALxqCLGn9zAXvgTZGhWEbq3C81FBpz6yIIKPcPkGO07fbTTp5kWLe0vcDLlH
         vp8LyC4LcnPF2Pggbd9y6cH/Gnw8IIfHlbe9tKgyDVZJMknyv2oTHxhL2miDv2c/sbpP
         a+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=ieDMAA9yb+riKiWlcn1PcAR1xXEldRWacm/9O7wTeN8=;
        b=HH9DIIvTV5diVlBQ1/4QKf2W9JPvsWnCZtograAAYjC1JyNcy9DJORj2wE/IiB9xB/
         uxR2jMroWH5PGpCtHKAea98LF7xdXETCn5eWyLExAyrjJHe0XRCTW/GN81/yh43vH9C8
         mgx+jXAhs/GpNwezVEeLst+i6EUz/Z46lvoeBSLw/W/o5U9vkX0mWTqBxncJeGniN2yz
         W1xH5Lb7BIey5a5Zlhjxd+52n4CGLB9AGRJxBhcemC+7QlVmSXpnneWQJZbBdqCIHsHk
         H3yv7R7/WP05J9yB/fUiZIb3RJ82QItX3rzpVD+U9Kz+Hpcl1+p/suuRJULztpeyCOZe
         dJBg==
X-Gm-Message-State: AOAM5313O5I0OlNidwvX+1ZBXlSxsjupNORMY2D8VlhuEPkIl3dw6mTH
        iM7Bd2Yg3RAze/YwjtM+SFlZvE+Bd50=
X-Google-Smtp-Source: ABdhPJxvF0Rnykg+85HahVRnZh8qJWdTTiKTpX+rmJCnhe7VLO0T8GVfHn/BAEUZc6vpdip9nZBQow==
X-Received: by 2002:a19:f00b:: with SMTP id p11mr14578601lfc.210.1589291746086;
        Tue, 12 May 2020 06:55:46 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id 68sm14507611lfn.41.2020.05.12.06.55.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 May 2020 06:55:43 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org
Subject: Re: BBB with v5.7-rc5
In-Reply-To: <20200512134648.GD37466@atomide.com>
References: <87k11h4df0.fsf@kernel.org> <87eerp46h5.fsf@kernel.org> <20200512134648.GD37466@atomide.com>
Date:   Tue, 12 May 2020 16:55:39 +0300
Message-ID: <878shx45r8.fsf@kernel.org>
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

Tony Lindgren <tony@atomide.com> writes:
>> Felipe Balbi <balbi@kernel.org> writes:
>> > what's the trick to get BBB to boot recent kernels nowadays? :-p
>> >
>> > I'm using omap2plus_defconfig without CPSW (doesn't link otherwise) wi=
th
>> > GCC 10.1.0 (I'll try an older version shortly). Cmdline is the usual
>>=20
>> same result with 9.2. Nothing from low level debug either.
>
> Maybe check you have a current dtb file? The older dtb files may not
> have all the needed data.

yeah, loading all the data from sd card. I am, however, using the u-boot
that came with the board.

> Also you probably want to add "earlycon" to your your kernel cmdline
> and then you have early output from CONFIG_SERIAL_EARLYCON=3Dy as long
> as there's a chosen entry for the device uart. So no need to enable
> DEBUG_LL in most cases.

cool, I'll try earlycon, then.

> There's "[PATCH net v4] net: ethernet: ti: Remove TI_CPTS_MOD workaround"
> being discussed too for the cpsw regression.

Thanks

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl66qtsACgkQzL64meEa
mQYx7Q//VmcUCxpsgoPsIB1x6r73MOuwi0ywJqixymLH3nyr5fmG0hq03RUtZww2
p1jc9Z+jza5wxkzfjBaf07sRtCixnj9I+wsa2VfPreAhVbFVlNZowsaFa+eLE8/3
J21trEG2qCHdnYC1CzDEiTdxcN2zrOvahN/p1Z99t2A1YrQhIdb9PfgdnACJ2y8O
dljwGX+OYzB6wDEgKCwfJvOSBIML2vElD+XiHlL+ehSJ+8v/4Zxpci9YSv4wGJCp
JdPOyjTkkBjW7mQk7Tj976q8mpq9JmT7YyisPi9IQFZkEEXUE3sRjOuVQ+QSmX3E
THUhxn3es5gFc29TLiYFMmOu34qiBIbtoGLFim5u2R5USS/Kwgp0qqkfupMD37P6
bzLfZcXUy3c5eGhxSZ9nbKO9xfQs/8IeJSiYVrfZyb4NY3VMwZpmwehLSOK+I0un
c1/rLe2+WVlZcqb4R0CXYMUGmH8jAuSeoNZfgc+rpm/ND+QH6FWxMauiW9Dl/Sui
DmMoOuutClV9RZlH20QzwviNxGHpQMmpfyIDlaoo2BdT6i/Z2jq1SNS5CFoSYuCp
k/D+1VphBfmgJr/7Xx9nTXGXJ5LwVizshesH9oJR1pCSS48NI0CoC3T4ygFRRWgv
HrRDvrfN+a08YGCYAOubkm4lFpovmn4byOQ1jU/W2keu90vRRJI=
=0Jg/
-----END PGP SIGNATURE-----
--=-=-=--
