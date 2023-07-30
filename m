Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A62E76858A
	for <lists+linux-omap@lfdr.de>; Sun, 30 Jul 2023 15:22:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbjG3NWi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 30 Jul 2023 09:22:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbjG3NWh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 30 Jul 2023 09:22:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 443C410B;
        Sun, 30 Jul 2023 06:22:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CC5E560C59;
        Sun, 30 Jul 2023 13:22:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87871C433C7;
        Sun, 30 Jul 2023 13:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690723356;
        bh=P6nPWoKkxLgNiPFLFCS/pA3Yhg+T0LHnBETGJfKED3k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HE9OFlxOrv4Vx3o9jpsWD/v8UK6ftT2ikE37v64Vk03ummVdqJkSipsfe34M508ok
         Bf5i3/5wVedwAm6wLsh7NiT8rgumrT069jwkdGTPZRusArpkVt06uj2/64sJPYEhIa
         BrPunXOkwmqm/cJMQgxZkDKy1b7+5AouaHPL4/Y78qnQw3sIln51jMVMEWnVlLFJQt
         IdJUqFaOw3tO3FGbXxm4mmRmdGIlPTX4YmVufnqSM0BJsNk3O2VSm4ocKVFeih7V3K
         lNvltHclccx1pdb+Zn+5ydiR4ugPVO6ad6GACP/B4HEB6XoUGHp935x+ZunwXD3xaO
         BOY08iSg7gCaw==
Date:   Sun, 30 Jul 2023 21:22:17 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 3/6] ARM: dts: nxp/imx: Replace deprecated
 extcon-usb-gpio id-gpio/vbus-gpio properties
Message-ID: <20230730132217.GP151430@dragon>
References: <20230724103914.1779027-1-alexander.stein@ew.tq-group.com>
 <20230724103914.1779027-4-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230724103914.1779027-4-alexander.stein@ew.tq-group.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Jul 24, 2023 at 12:39:10PM +0200, Alexander Stein wrote:
> Use id-gpios and vbus-gpios instead.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied, thanks!
