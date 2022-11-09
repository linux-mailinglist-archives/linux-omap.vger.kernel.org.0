Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFEE5622590
	for <lists+linux-omap@lfdr.de>; Wed,  9 Nov 2022 09:36:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229924AbiKIIgA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Nov 2022 03:36:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229969AbiKIIf6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 9 Nov 2022 03:35:58 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9258013DF5;
        Wed,  9 Nov 2022 00:35:57 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 02D7780FB;
        Wed,  9 Nov 2022 08:26:10 +0000 (UTC)
Date:   Wed, 9 Nov 2022 10:35:55 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Dominik Haller <d.haller@phytec.de>
Cc:     linux-omap@vger.kernel.org, bcousson@baylibre.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        devicetree@vger.kernel.org, upstream@phytec.de
Subject: Re: [PATCH] ARM: dts: am335x-pcm-953: Define fixed regulators in
 root node
Message-ID: <Y2tma81uGWYZjxVW@atomide.com>
References: <20221011143115.248003-1-d.haller@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221011143115.248003-1-d.haller@phytec.de>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Dominik Haller <d.haller@phytec.de> [221011 17:22]:
> Remove the regulators node and define fixed regulators in the root node.
> Prevents the sdhci-omap driver from waiting in probe deferral forever
> because of the missing vmmc-supply and keeps am335x-pcm-953 consistent with
> the other Phytec AM335 boards.
> 
> Fixes: bb07a829ec38 ("ARM: dts: Add support for phyCORE-AM335x PCM-953 carrier board")
> Signed-off-by: Dominik Haller <d.haller@phytec.de>

Applying into omap-for-v6.1/dt thanks. With the fixes tag it will get
picked into the stable kernels too.

Regards,

Tony
