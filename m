Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36C9E6C9D7D
	for <lists+linux-omap@lfdr.de>; Mon, 27 Mar 2023 10:19:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232390AbjC0ITW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 27 Mar 2023 04:19:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233073AbjC0ITC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 27 Mar 2023 04:19:02 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 41E072D5A
        for <linux-omap@vger.kernel.org>; Mon, 27 Mar 2023 01:18:49 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 89ED38108;
        Mon, 27 Mar 2023 08:18:48 +0000 (UTC)
Date:   Mon, 27 Mar 2023 11:18:47 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Steffen Hemer <s.hemer@phytec.de>
Cc:     linux-omap@vger.kernel.org, upstream@lists.phytec.de,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        bcousson@baylibre.com
Subject: Re: [PATCH 1/8] ARM: dts: am335x-phycore-som: Add alias for TPS65910
 RTC
Message-ID: <20230327081847.GG7501@atomide.com>
References: <20230214132302.39087-1-s.hemer@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230214132302.39087-1-s.hemer@phytec.de>
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Steffen Hemer <s.hemer@phytec.de> [230214 15:23]:
> Without an alias for the TPS65910 RTC, it snatches the rtc0 device in
> advance to the I2C RTC assigned to that alias.

Applying all eight patches into omap-for-v6.4/dt thanks.

Tony
