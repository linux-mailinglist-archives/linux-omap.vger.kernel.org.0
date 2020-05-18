Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE4DB1D72CB
	for <lists+linux-omap@lfdr.de>; Mon, 18 May 2020 10:18:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726932AbgERISp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 18 May 2020 04:18:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726489AbgERISp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 18 May 2020 04:18:45 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C0D0C061A0C;
        Mon, 18 May 2020 01:18:45 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id g4so8836908ljl.2;
        Mon, 18 May 2020 01:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=h+Jor+/LX/T3dOkaHG06o8oKZPP+jxM2LIbLly8QyTw=;
        b=dGTXtXSHH+MliSmXwudIH+af9C2qYhJaLKRkSgtQZKStsDBbLEn/2aXYsxzK8kRlSv
         S/eVusPsylrneDLcOr7VBfhLbYnGzxKy2uAxXgC5Gkp6o8mvwctDrhR8K3FcYqEpB3ud
         EArs0hav78XIBdlOqoD4SuKey4y2IrWbF9gfPAw3iac5u4+qQDikYVlwacjhmcreDOPm
         wWgKvtysGr5f7vOYZtJ0rDpGiOpqMGeV7ouZ9zycBB2TawIoPmdFWQLuYxp06gguqn/U
         1LnT++ktzV8YhYA6nTdy5Ih6kASkj5pawH35wNZ26p8kaHXkiP2SjMkeVmCPffYlvebB
         kkCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=h+Jor+/LX/T3dOkaHG06o8oKZPP+jxM2LIbLly8QyTw=;
        b=PrVbNaYBS0GG1esbHqLo0RaiFOnTFeA2KrTPzf2JGmMsV800T2BxXbn3uUswtEQAQd
         Xq/82jSmwEug65i+buRiYkGoYSFV2b0pGXWS+L63iPfgumzx+kLX6UPJU6lPHW+m1qGv
         FwQnmKz1P2YpsB48maydgfgTQVQtbud8hgnaWsJMOcU/jXgVCka1ThuEWUaCaqJUVkox
         0UM/tx77tVjo7URkLeRvKStVXfMcv+DYijMvp4GG/LjETse7r98m0kKDMlR0WN3w7ibu
         TUewxXBWwM9bx8OzSXNGMr4DhPDNkJC/plr7IzXo/9R3DfSFPqSKDJwOnTPh+TVsyyat
         7SSA==
X-Gm-Message-State: AOAM533mtOsAvjrwKDeWfbV+9h0xSL6MfGrhzRpE3ZHprJ7WINMUZOEi
        nl+ljm6jsSX+mLhNK+UvViM=
X-Google-Smtp-Source: ABdhPJy0lSdsA1WdHayXUZZeXPQ7bF5+JBHivyWS/3sdkBCjRnjpm07VsxjGIxDlo72LLooXcdKdag==
X-Received: by 2002:a2e:9093:: with SMTP id l19mr1148378ljg.27.1589789923538;
        Mon, 18 May 2020 01:18:43 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id z5sm383072ljm.64.2020.05.18.01.18.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 May 2020 01:18:42 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Drew Fustini <drew@beagleboard.org>
Cc:     Grygorii Strashko <grygorii.strashko@ti.com>,
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
In-Reply-To: <CACRpkdb+ZP6rfjGg6Ef9_wYvNf6qmSc7LZyYBVKA3XWCtxPfqQ@mail.gmail.com>
References: <20200508165821.GA14555@x1> <CACRpkdb+ZP6rfjGg6Ef9_wYvNf6qmSc7LZyYBVKA3XWCtxPfqQ@mail.gmail.com>
Date:   Mon, 18 May 2020 11:18:38 +0300
Message-ID: <875zcty7tt.fsf@kernel.org>
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
>> gpiochip0 - 32 lines:
>>         line   0:   "ethernet"       unused   input  active-high
>>         line   1:   "ethernet"       unused   input  active-high
>
> Why are the ethernet lines not tagged with respective signal name
> when right below the SPI lines are explicitly tagged with
> sclk, cs0 etc?
>
> Ethernet is usually RGMII and has signal names like
> tx_clk, tx_d0, tx_en etc.
>
> Also some lines seem to be tagged with the pin number
> like P9_22, P2_21 below, it seems a bit inconsistent
> to have much information on some pins and very sketchy
> information on some.

the pin names match the beagle bone documentation and would help users
figure out which pins on the expansion headers match to a gpio signal.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl7CRN4ACgkQzL64meEa
mQYTRQ//TUIxIdxJ0j0fQXEyJPGhdqPAmQQqf/oPQNarULsaoObXiAG65YXMZzCz
G1yUBf7EP10S6fHda72GpvqJj1K+Yhr/CPmyCNmrrU8N1vr19rCQZtZ3qT4IIflz
StTPQ9PPBdbhAi/g7x+nLMV5Jrer4pNVZ165EUVKE5WJJKdZ6VMOs+xgvnlLVVDk
XmOqHiwOE21d+EiymWVrPrpZF8XuzCLBFw34y7o8AsAR2qYK2wrrGqftvq+d+eQ3
YhC3k8JedCBTQkVPNpxSB7hcFezBukCqzyFs957LX/wqULT6xcfmbbfLj9o4jn/k
pY2hh4ULDaRwxMW8AVtck4li8mdrvM66uyjjibK6sqKBOSIAlRE4y1FZWzPeZOZ2
KwWZvOw31m0JPBzcNF4GZLKmORfYQQTGMo54anCVDCYe61Fv4/QtS8HK5162icjP
90RY2N8As0Qo1tHQwBFVsQLLQWK+OT+6Botf34dqgPrM5LZMvgVNvKNE1lB3PQ37
0n+S+gbKfNFgiBMWlo0Qm37h7x//t5rzGW2K82Icp9YPdmZrOCnRytQmKiJH7gcp
XIdnCCw3cIfaWz3utE+Z6ytuNNzLlcMmglr7sOY2h3VCQ/ByMZZpAYmL7CRLy7Of
+uF42QBNHoYcAKfkqhyAqvEK2dVlt3hxLVP4pdTywm+CHc/D2L4=
=KGpi
-----END PGP SIGNATURE-----
--=-=-=--
