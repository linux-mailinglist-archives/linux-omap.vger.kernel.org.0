Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BB5563A190
	for <lists+linux-omap@lfdr.de>; Mon, 28 Nov 2022 07:49:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbiK1GtK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 28 Nov 2022 01:49:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229679AbiK1GtJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 28 Nov 2022 01:49:09 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 136641275C;
        Sun, 27 Nov 2022 22:49:09 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 5F59280F5;
        Mon, 28 Nov 2022 06:49:08 +0000 (UTC)
Date:   Mon, 28 Nov 2022 08:49:07 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] ARM: dts: omap: echo: use preferred enable-gpios
 for LP5523 LED
Message-ID: <Y4RZ4xQFQr16m/44@atomide.com>
References: <20221127203034.54092-1-krzysztof.kozlowski@linaro.org>
 <20221127203034.54092-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221127203034.54092-2-krzysztof.kozlowski@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> [221127 20:30]:
> The preferred name suffix for properties with single and multiple GPIOs
> is "gpios".  Linux GPIO core code supports both.  Bindings are going to
> expect the "gpios" one:
> 
>   omap3-echo.dtb: lp5523A@32: 'enable-gpio' does not match any of the regexes: '^led@[0-8]$', '^multi-led@[0-8]$', 'pinctrl-[0-9]+'

Feel free to apply this along with your other clean up patches:

Acked-by: Tony Lindgren <tony@atomide.com>
