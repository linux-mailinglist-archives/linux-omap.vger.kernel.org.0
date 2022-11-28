Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E11F463A182
	for <lists+linux-omap@lfdr.de>; Mon, 28 Nov 2022 07:47:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbiK1GrE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 28 Nov 2022 01:47:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbiK1GrD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 28 Nov 2022 01:47:03 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DAF4B5FA7;
        Sun, 27 Nov 2022 22:47:02 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 53B4680C1;
        Mon, 28 Nov 2022 06:47:02 +0000 (UTC)
Date:   Mon, 28 Nov 2022 08:47:01 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: am335x: align LED node names with dtschema
Message-ID: <Y4RZZU2mfWmvlnIK@atomide.com>
References: <20221125144118.476905-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221125144118.476905-1-krzysztof.kozlowski@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> [221125 14:41]:
> The node names should be generic and DT schema expects certain pattern:
> 
>   am335x-baltos-ir2110.dtb: leds: 'app', 'power', 'wlan' do not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'

Feel free to apply this along with your other clean up patches:

Acked-by: Tony Lindgren <tony@atomide.com>
