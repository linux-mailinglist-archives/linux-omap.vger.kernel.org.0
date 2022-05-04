Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97946519EFB
	for <lists+linux-omap@lfdr.de>; Wed,  4 May 2022 14:10:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242185AbiEDMOL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 4 May 2022 08:14:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349196AbiEDMOK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 4 May 2022 08:14:10 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E29EB1707B
        for <linux-omap@vger.kernel.org>; Wed,  4 May 2022 05:10:34 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1nmDpx-0008Bl-5z; Wed, 04 May 2022 14:10:33 +0200
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1nmDpt-000527-Jl; Wed, 04 May 2022 14:10:29 +0200
Date:   Wed, 4 May 2022 14:10:29 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Gireesh.Hiremath@in.bosch.com
Cc:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        bcousson@baylibre.com, tony@atomide.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, dmitry.torokhov@gmail.com,
        mkorpershoek@baylibre.com, davidgow@google.com,
        swboyd@chromium.org, fengping.yu@mediatek.com,
        y.oudjana@protonmail.com, rdunlap@infradead.org,
        colin.king@intel.com, sjoerd.simons@collabora.co.uk,
        VinayKumar.Shettar@in.bosch.com,
        Govindaraji.Sivanantham@in.bosch.com, anaclaudia.dias@de.bosch.com
Subject: Re: [PATCH 2/4] Input: mt-matrix-keypad: Add Bosch mt matrix keypad
 driver
Message-ID: <20220504121029.h6z2vtbapllkfsad@pengutronix.de>
References: <20220504105254.1576-1-Gireesh.Hiremath@in.bosch.com>
 <20220504105254.1576-2-Gireesh.Hiremath@in.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220504105254.1576-2-Gireesh.Hiremath@in.bosch.com>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-omap@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Gireesh,

On 22-05-04, Gireesh.Hiremath@in.bosch.com wrote:
> From: Gireesh Hiremath <Gireesh.Hiremath@in.bosch.com>
> 
> add support for keypad driver running on Bosch Guardian
> Dtect board using TI-am335x cpu. Driver implementation
> is based on matrix_keypad.c

pls can you tell me the main difference between the already existing
matrix_keypad.c driver and your driver. If there are only minor
differences I would rather add those to the existing driver.

Regards,
  Marco
