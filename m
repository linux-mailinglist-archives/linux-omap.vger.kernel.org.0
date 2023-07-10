Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CBF574CF78
	for <lists+linux-omap@lfdr.de>; Mon, 10 Jul 2023 10:08:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229451AbjGJIIt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 10 Jul 2023 04:08:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230234AbjGJIIr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 10 Jul 2023 04:08:47 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B701EB;
        Mon, 10 Jul 2023 01:08:46 -0700 (PDT)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id D7EE166057B8;
        Mon, 10 Jul 2023 09:08:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1688976525;
        bh=OM7rflBYguD1maMIODmrv7tZEbI632CV+e5rw9umrGs=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=kxJzgMBL7nRS5ctWr9TCrAqewi9ak1OkH8fxcs+/Qd6cZYCG3l2BWUSUWwcpy+Pfk
         KFsFsGaFSczMymtsZT/P32vVUuppOUnLtVIf/tfcOJnOlFVsng+t8PDFN2F5eNJ5/K
         22d2coqLnyxteVEEEEcNqNjKCsfy76B+Am2z45EwoR9S5rF1EG6Pf/NFGASToMhYja
         dBXzXptlugWoikyF4L7MhdZ487xW8bAFcFp255lV3yGh7Z+XgOE0QJ28we9VOp+W1H
         NahtL8YtZh48QzD1ud0Lr19v9fgAAak+uD+sOLtvO5IRMSosRjAdKPUKoEvfAl83uV
         w52tXwrU+cA6w==
Message-ID: <0b665705-eba3-74d4-c49c-586a485f736b@collabora.com>
Date:   Mon, 10 Jul 2023 10:08:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 3/3] arm64: dts: Replace deprecated extcon-usb-gpio
 id-gpio/vbus-gpio properties
Content-Language: en-US
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org
References: <20230615145838.1526919-1-alexander.stein@ew.tq-group.com>
 <20230615145838.1526919-3-alexander.stein@ew.tq-group.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230615145838.1526919-3-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Il 15/06/23 16:58, Alexander Stein ha scritto:
> Use id-gpios and vbus-gpios instead.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Acked-by: Heiko Stuebner <heiko@sntech.de> #rockchip
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com> #mediatek

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


