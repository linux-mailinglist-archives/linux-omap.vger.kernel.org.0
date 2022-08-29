Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9C0D5A467B
	for <lists+linux-omap@lfdr.de>; Mon, 29 Aug 2022 11:51:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbiH2Jv3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 29 Aug 2022 05:51:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbiH2Jv2 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 29 Aug 2022 05:51:28 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD5805E544;
        Mon, 29 Aug 2022 02:51:25 -0700 (PDT)
Received: from mail-wr1-f53.google.com ([209.85.221.53]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MAfQk-1oZECh1Xdw-00B0If; Mon, 29 Aug 2022 11:51:23 +0200
Received: by mail-wr1-f53.google.com with SMTP id az27so9456056wrb.6;
        Mon, 29 Aug 2022 02:51:22 -0700 (PDT)
X-Gm-Message-State: ACgBeo1cdW7Ud/KXAcDgKJg54KDGFmdQy7RgJV68olTI2Ez5P56n7hnN
        HnEYMrHAmR0ki9RZgu7dvem1mbIma6k4U72r6g4=
X-Google-Smtp-Source: AA6agR4dO9Qog99EOhFMYD2/TUvDUFPeLAFKpCKJySAtY2CWxJsmH8fvbDozC2seipJY5siIbg1N/2rhc6q5GDAswIQ=
X-Received: by 2002:a17:907:d0b:b0:741:7ca6:a2b with SMTP id
 gn11-20020a1709070d0b00b007417ca60a2bmr3580848ejc.654.1661763177783; Mon, 29
 Aug 2022 01:52:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220818135522.3143514-1-arnd@kernel.org>
In-Reply-To: <20220818135522.3143514-1-arnd@kernel.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 29 Aug 2022 10:52:41 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1tsby7+xfKTQaaBQZ4t-=uWG5Dtbcn_jPEsSMG_YVHgA@mail.gmail.com>
Message-ID: <CAK8P3a1tsby7+xfKTQaaBQZ4t-=uWG5Dtbcn_jPEsSMG_YVHgA@mail.gmail.com>
Subject: Re: [PATCH 00/11] ARM: defconfig cleanup
To:     linux-arm-kernel@lists.infradead.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Qin Jian <qinjian@cqplus1.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>, Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tudor Ambarus <tudor.ambarus@microchip.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Vladimir Oltean <vladimir.oltean@nxp.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Shannon Nelson <snelson@pensando.io>,
        Peter Chen <peter.chen@nxp.com>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Felipe Balbi <balbi@ti.com>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:gf85k6zCm5cJECsQs0SxRf847/xq4I8ODO7U+Gj6k40fdTozveb
 ELMjAat5zmIE6s9q9Wptq93QYI1b5l8o38ZGAYjV5JZ8cmpULenjiyPXQVvHEQgV6mF130v
 VSJnO02CRXim3eSApkQCq8P2pGrhvU8o05XEwg/HVMbEnmhNu0h4E2mqxfz6cMReAEPRZDR
 1SkGK7PVFUuDfdBuTn0fw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:voOQ47dxVno=:PWIiRwLvZoKwxn1je+6eqX
 zzuj+QAdkWrtqZZmv9hITubgCl/xx1huPOm3X7bQaL+aRwz2a81CEwnGHzlNET9Myc6rrI3Ts
 ldk1ewreYruxMeNpTwKoyI7cyFO18t3PGqs1UdV78+nqTjUJj6MtLjvCx7PC7k4rrq/Foet2N
 gCc2r8833dfAMINc1nLyMxrz+MgyQORVUbyjFzAz36PZwf0paK/QzZVd0Q+14C4uA6NoUe5Hy
 Dl9crudMA9Sst2ETlhefH4ncE5R4xgDUKteSJ85R6nkovqlQN84letbl16oLxHVVMEX3LofCP
 09ElDRovbRApc0nT6hWJ9xTOv3ka5QRkoOceCvGICFYoiJv1yASbB+u1QI6pb6T3ysiUiQcdV
 uTpvI1lv0X6scUo9xyC1rRJKZbr5BKOGPGwUbswxrMAWJ3K4+XFNqPDAugeYsfZ/2r4ERerHz
 D8IqpwPdDAkZh8A3WNcicCZ6aLVVejh3D5lSEQlkrbUnApAY4KrGPTXkI+Q8zxNZ7ctGjqccn
 6DLvIQvHii2UbO0zKXSOiznK3zXssly8jRGS42PyRUMASCd34sm+QWjAFK3CMzmfwlbY96aeZ
 2Vnp1vM/GJpcy7CSG3GAJghov7BJzknwv9993qrShvb51nUJ2pGNzPCC6hTgyxAuCPs4Io4Yy
 ITZAMmcq9z/G25OZUO9j4i0bft9caKDl3DuFY+oYJBk71Dnmu5SSyRW6UlXc/yyj1LjIgARUj
 /nyE4DrbW2xx+sFdPdxUNkw4JIpmOde2ffmaJ50Kxsas/FmbIHpE4SuScXRLZf0XCLqnuisxA
 BifvE3qsJaviSfrX3teBxsIFa6YNvCESM6NJSTAQzPj2lenERzYcQF1xyolfz4ZlGeSVDYzEz
 Dc/hU1HNMA9yHJ5fWXQQ==
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NEUTRAL,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Aug 18, 2022 at 3:55 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> I have continued the cleanup of the multi_*_defconfig files, and
> reordered the other files according to the 'make savedefconfig'
> output as before.
>
> I would like to queue these up for 6.1, though the last two
> should probably be considered bugfixes and merged for 6.0.
>
> Since a third of the defconfig files are for machines that
> are now marked as unused, I skipped those files. There are still
> a few things that get removed by 'make savedefconfig' as they
> now get selected by some driver:
>
> -CONFIG_SERIAL_BCM63XX=y
> -CONFIG_SND_AUDIO_GRAPH_CARD=m
> -CONFIG_NEW_LEDS=y
> -CONFIG_LEDS_TRIGGERS=y
> -CONFIG_TEGRA20_APB_DMA=y
>
> I think for those we should follow up with patches to remove the
> 'select' statements.

I dropped the last patch that Greg has already picked up, and merged the
rest into the arm/defconfig branch of the soc tree.

Thanks for the Acks.

        Arnd
