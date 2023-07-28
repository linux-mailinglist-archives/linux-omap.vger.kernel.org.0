Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FCE27662B7
	for <lists+linux-omap@lfdr.de>; Fri, 28 Jul 2023 06:05:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231354AbjG1EFv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 28 Jul 2023 00:05:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230009AbjG1EFt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 28 Jul 2023 00:05:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AEA330DB;
        Thu, 27 Jul 2023 21:05:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BCCEA61FB1;
        Fri, 28 Jul 2023 04:05:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 910D6C433C7;
        Fri, 28 Jul 2023 04:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690517147;
        bh=2IkY25YAfB9fyvU9p02L4SvtbdbBgqTgi4g+lcXTQbY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iueYcCS8E8vePhJayUOPdgR1Md/OQ7L2LVyLS4zKXI4p8c0fCE3Em+d2KDcj8UEPP
         YiatY3D2gUxoY0bCsZHnRPBuhsfVUkO7WixC7qqq/EjWlxdUvTtBkEAUKDG33pbID+
         dcCVgrPJpGXmu1ppcd9lCkHD2SbQX9wQ0TRbuJZVaxJUyeZdLoJYWT6y+eLAokFkOi
         mcBVbHHY8SO26FO6pCbG5gM+CfCiXwWKktKdkuffF//o9a7MLlGSvpgX7uQ+AyGpsn
         oNZme42d6ZeyFnnFXwnMt/DtIDb/Hw3nozS0TFa50/e1jD83VS8cNOazmhAUQhpxAG
         2t8D4lxTLAC0w==
From:   Bjorn Andersson <andersson@kernel.org>
To:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: (subset) [PATCH v4 0/6] extcon-usb-gpio YAML conversion
Date:   Thu, 27 Jul 2023 21:08:51 -0700
Message-ID: <169051733320.1270972.17486978837874639727.b4-ty@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230724103914.1779027-1-alexander.stein@ew.tq-group.com>
References: <20230724103914.1779027-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


On Mon, 24 Jul 2023 12:39:07 +0200, Alexander Stein wrote:
> after some misunderstanding on my side, sorry for that and the noise, v4
> series now includes now all the changes for the bindings and DT in
> individual patches.
> I've transferred the R-b and A-b tags to the individual patches in the
> arch/arm64 patches. Only to specific patches, e.g. mediatek, if sent with
> #mediatek inidicator, to all patches otherwise. arch/arm has still yet to
> receive feedback.
> 
> [...]

Applied, thanks!

[6/6] arm64: dts: qcom: Replace deprecated extcon-usb-gpio id-gpio/vbus-gpio properties
      commit: f648504139a6f91224276ab77be684ba3da649d2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
