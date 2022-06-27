Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3040055CC7D
	for <lists+linux-omap@lfdr.de>; Tue, 28 Jun 2022 15:01:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233863AbiF0K5F (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 27 Jun 2022 06:57:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233852AbiF0K5E (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 27 Jun 2022 06:57:04 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 055A9646F;
        Mon, 27 Jun 2022 03:57:04 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 23E3F8106;
        Mon, 27 Jun 2022 10:51:53 +0000 (UTC)
Date:   Mon, 27 Jun 2022 13:57:02 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: am33xx: Map baseboard EEPROM on BeagleBone
 Black
Message-ID: <YrmM/nCKXwcqK6n1@atomide.com>
References: <20220620152150.708664-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220620152150.708664-1-broonie@kernel.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Mark Brown <broonie@kernel.org> [220620 18:17]:
> The identification EEPROM on the BeagleBone Black baseboard is supplied
> by VDD_3V3A which is supplied by LDO4 on the PMIC. Map this as per the DT
> binding for the EEPROM. Since this supply is always-on this has no
> practical impact but it does silence a warning at boot due to using a dummy
> regulator.

Thanks applying into omap-for-v5.20/dt. Sorry looks like I missed your
earlier patch somehow.

Regards,

Tony
