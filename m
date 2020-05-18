Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 041251D78B1
	for <lists+linux-omap@lfdr.de>; Mon, 18 May 2020 14:34:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726993AbgERMeb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 18 May 2020 08:34:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726800AbgERMeb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 18 May 2020 08:34:31 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 101D1C061A0C;
        Mon, 18 May 2020 05:34:31 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id o14so9671300ljp.4;
        Mon, 18 May 2020 05:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=tpIXCdN3gj595qpUOD6MxaqO71H7TphyzCikrM53G/Q=;
        b=lTLCYazhegtr2OT4Z0FOfyNO6zqXE18vxQ8pMI+ZQGG1mHGvS9K9SUCY5cUcdWGchE
         i0yvWTXO0PGccyB5QFr2bgNoWLPm/fLw85m9tI/yQDXfXTVKHKr1xYG/8nChy+0FZkPv
         k+2Pb5zD148x5EldXXohPOXsPzKHEc702IclWCE9JvOZRXpLoTOCZKuVNhmtjf5yq1gb
         7/GMmSc9mRP86cMOcKRSWiLD5pmmpvzu2+jyLAE913mKj8F18iPheL3SpIHUwhKhM2KX
         dPmd5JDFKAsLs3/eQskcTwyaRpkv6sATfjCOTgT6L+Mmz3dvM41l7JH7l7dLyZ7EVWvA
         i3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=tpIXCdN3gj595qpUOD6MxaqO71H7TphyzCikrM53G/Q=;
        b=G3RJNnZ3eXmf+ZXRP03XIajGl1Dt/PH/lzTv/ns21+rp2NdRckHlffZ3UUXdJlL2A3
         t5UMb3jACpmQbQc5/KH/8XPtAHo0KYg0tF0Oh/FTZje/JiO6m17TpP9HpUPQzH5f9F9Z
         L5nNxiknvxw+YHbnUsR1r4PzNpZCZ56Hsd21uv6nvmHsb0fN7Fof9d24vYpucFTmm+N0
         KvSqnpKfHJFI9IiU+lyYh5/1gnPMC197jT3Gl8z9+5xcK2Be33FBAHR9zNkpcIEaIdbA
         q9j47aC8yygzK0eOE5NV1IppoKrPBwEqTzn+LIEBZmG80gg4KfF70eGRzEdWcxR2bDFv
         2+wA==
X-Gm-Message-State: AOAM531LRckdblXd0B7zHb0vwy/LPEQbYKbWbX9uMgKQPWs9pFq/pkEM
        mnnP++vTPumck2bpeYi9YMY=
X-Google-Smtp-Source: ABdhPJxQTk33pnsR2sFs2XCrcVmecXuim2j8pHd5sogu/7KpL5KOGEKB7yJtg7B+GE3xMMjg9aIL6w==
X-Received: by 2002:a2e:920f:: with SMTP id k15mr9580600ljg.131.1589805269354;
        Mon, 18 May 2020 05:34:29 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id f5sm6773079lfh.84.2020.05.18.05.34.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 May 2020 05:34:28 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Drew Fustini <drew@beagleboard.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "open list\:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel\@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>
Subject: Re: [PATCH] arm: dts: am33xx-bone-common: add gpio-line-names
In-Reply-To: <CACRpkdZnnRXwv0-71t93HX42jL-muty4yJx5gW6_P3yOM-sGAg@mail.gmail.com>
References: <20200508165821.GA14555@x1> <CACRpkdb+ZP6rfjGg6Ef9_wYvNf6qmSc7LZyYBVKA3XWCtxPfqQ@mail.gmail.com> <875zcty7tt.fsf@kernel.org> <CACRpkdZnnRXwv0-71t93HX42jL-muty4yJx5gW6_P3yOM-sGAg@mail.gmail.com>
Date:   Mon, 18 May 2020 15:34:23 +0300
Message-ID: <87zha5whf4.fsf@kernel.org>
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

Linus Walleij <linus.walleij@linaro.org> writes:

> On Mon, May 18, 2020 at 10:18 AM Felipe Balbi <balbi@kernel.org> wrote:
>> Linus Walleij <linus.walleij@linaro.org> writes:
>> >> gpiochip0 - 32 lines:
>> >>         line   0:   "ethernet"       unused   input  active-high
>> >>         line   1:   "ethernet"       unused   input  active-high
>> >
>> > Why are the ethernet lines not tagged with respective signal name
>> > when right below the SPI lines are explicitly tagged with
>> > sclk, cs0 etc?
>> >
>> > Ethernet is usually RGMII and has signal names like
>> > tx_clk, tx_d0, tx_en etc.
>> >
>> > Also some lines seem to be tagged with the pin number
>> > like P9_22, P2_21 below, it seems a bit inconsistent
>> > to have much information on some pins and very sketchy
>> > information on some.
>>
>> the pin names match the beagle bone documentation and would help users
>> figure out which pins on the expansion headers match to a gpio signal.
>
> OK if it is how it looks in the documentation I agree that is what
> users need, maybe the documentation is confusing but there is not
> much to do about that.

the board has two expansion headers, P1 and P2:

https://github.com/beagleboard/pocketbeagle/wiki/System-Reference-Manual#53=
1_Expansion_Headers

Pins are always the pin number on the header, hence P2_21 and P1_10 and
so on.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl7CgM8ACgkQzL64meEa
mQa02A//W7ZWqA6ND2rDES1cxSEAwXyx02mdXu96eVdXV+2Q9FXd/OJvXrWSZDGa
xf0Yu7ve9EMUVbzq5kwINzMBL6nN7F2rtEtyfZkAcTFFSnedjHeWJqpqB1aKfZHs
/e+iy8NIcdVmCR9SAbW2Lfm0729cCBK/jSKLqnOeZIEzDn7Cg3VPtzzGNKUWqz2R
oiUq5GceYpHhOlQ+EuTDv1e5i/lr/UvQ08XWU08Mw7xQxTkdAUThM5Z0w3oi3BPo
zZ3rG7teke3+yUflzUX1fh9Uoa3aJeq2msafROF45kSeYTl7GBwXDB528sLtWAai
YX/f+z7LgdGd/vVNgRd+m/qv0qfnaCvDf/bJqqyI1JKRL+aYmv3j/T72ebgAw7EV
LpQfP6/mA7vVvVEJ78rJMgn5nkexXvs7vV34nAZ45H+Zyp+rHUfhYFVw8MEGOBZb
M4xzKfE40amu05zPkRMkVddTfjsBDpFD7biZu9aJREzi564Hnt8CQ/SUqq2fOVRw
5OQsIsSi8paC797xILnFHaM1PK/NaNqp8qKsF/dv98k1sELP1SAi9k+oJJ4KhWJ8
zdxnU9+1mbjd5AgrLac153LyaPX8z/W3TrjvvPpA9bHok2+vizWuVRDQl1dgcj16
n5OuWeutgO3DIi+iBhJtVtV1RUK7ywUHoYuZ3NM23VfFYA8bVAI=
=8tVN
-----END PGP SIGNATURE-----
--=-=-=--
