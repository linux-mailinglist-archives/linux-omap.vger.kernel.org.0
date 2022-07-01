Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2236456328D
	for <lists+linux-omap@lfdr.de>; Fri,  1 Jul 2022 13:28:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233758AbiGAL0n (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 1 Jul 2022 07:26:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231535AbiGAL0m (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 1 Jul 2022 07:26:42 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A2EE81482
        for <linux-omap@vger.kernel.org>; Fri,  1 Jul 2022 04:26:38 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id e28so2830315wra.0
        for <linux-omap@vger.kernel.org>; Fri, 01 Jul 2022 04:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=aFHV/YMyug+JphlF30utQBBa958Nn0h36N40YpiodWY=;
        b=HhIFIBIBVOEQZ43PCt4qVvnj90SFOytyATiPSXA1PQ4Wrtjzrbqb2pRFAgiz88UQ4j
         zwUdLkBJNqeWR/AoeUwQGk+FeLcrW4hs/4FcBYGsFhnVN6OANn9x1mn7ZUAbl1O6RnOU
         3Hj6ts3H7dAXZ8Fi0OFkzMZEg3ew9/RTTnbfgNNbUlstmkpqPcTFAtgBhtVm64zQWrDf
         By3LE01qj5Fma382fB+dUDUfzC4RWKIobavkId1qWt8ZmKoADqIR84TQkwZFhtWxef7H
         bFPKNe3raX6ZCrVGFTQNK7QIoeafCwVp8jSIfZQZtISnJZUWScihusylobMjbwevrxp7
         p4Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=aFHV/YMyug+JphlF30utQBBa958Nn0h36N40YpiodWY=;
        b=otidJuy55tttLbCG3JmryuUvBoCMGyIogU6O/2ZkrCeGOS6ptzcWifffD+JuKkbsMa
         rjtfnArWtmFV7XiiSPgicIin3xi0GnHQKO/6Lv/96TFkXQgKKg6RpcJKFA64XI6f9+xf
         mVsVIlg29nb/k/OUsdGuGs/XzROXtEqsPARAQKUbvs3RUE7X356tonYsd6+a2UA72m0c
         xPwKq1C9+g77xfktkB/CGfB4nF2MYqCHLcF5O6/x9E/dJyEs7IBSK49zQ76Rde6VadXw
         B2pZR/y8r0CspFZjN1gJ4p90zXO8/ZiAVsRLxrMZH4yS7oOy4AnPI+ZawtLuMuCAHrxI
         hgVg==
X-Gm-Message-State: AJIora/peuSRJ/G+WXreYueqD3YVPBGOW06cNKVbtV3Wi0DFsAm50OMu
        VQPMFFBEInQ7po2D6mSckDU=
X-Google-Smtp-Source: AGRyM1vDLt9ogZuQmWWAq9U3qG0jo9yagjt4xqDQvEF5giJnSAi9LrJV+jpTa7fxutGuW834mJEddw==
X-Received: by 2002:adf:e60e:0:b0:21b:a4d1:74fc with SMTP id p14-20020adfe60e000000b0021ba4d174fcmr12648987wrm.703.1656674797090;
        Fri, 01 Jul 2022 04:26:37 -0700 (PDT)
Received: from giga-mm.localdomain ([195.245.18.14])
        by smtp.gmail.com with ESMTPSA id s8-20020a05600c384800b0039c948dbb61sm10360020wmr.26.2022.07.01.04.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 04:26:36 -0700 (PDT)
Message-ID: <742b1630657a25a6396cb13008226437929bd8e6.camel@gmail.com>
Subject: Re: Scheduling (unused) board file removal for linux-6.x
From:   Alexander Sverdlin <alexander.sverdlin@gmail.com>
To:     Arnd Bergmann <arnd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Matija Glavinic Pecotic <matija.glavinic-pecotic.ext@nokia.com>,
        Aswath Govindraju <a-govindraju@ti.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Halasa <khalasa@piap.pl>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Marek Vasut <marek.vasut@gmail.com>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Hartley Sweeten <hsweeten@visionengravers.com>,
        linux-omap <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Lennert Buytenhek <kernel@wantstofly.org>,
        Marc Zyngier <maz@kernel.org>,
        Mauri Sandberg <maukka@ext.kapsi.fi>
Date:   Fri, 01 Jul 2022 13:26:35 +0200
In-Reply-To: <CAK8P3a2yh1Uh9+YP42ekt3LB9oTfEg0WMB5FVqwp40qHb6vWFg@mail.gmail.com>
References: <CAK8P3a0Z9vGEQbVRBo84bSyPFM-LF+hs5w8ZA51g2Z+NsdtDQA@mail.gmail.com>
         <CACRpkdY2_ZbmcSuuMB9t5bB-tGE0iAc-nE26JwxidRFocRahSw@mail.gmail.com>
         <CAK8P3a2yh1Uh9+YP42ekt3LB9oTfEg0WMB5FVqwp40qHb6vWFg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi!

On Fri, 2022-07-01 at 12:53 +0200, Arnd Bergmann wrote:
> > Patches also came from Nokia (!) last year see
> > ea4ab99cb58cc9f8d64c0961ff9a059825f304cf
>=20
> I would assume that both have been for keystone2 or k3, which
> share a lot of the drivers with davinci and are widely used with DT.

Indeed, this is for Keystone 2.

--=20
Alexander Sverdlin.

