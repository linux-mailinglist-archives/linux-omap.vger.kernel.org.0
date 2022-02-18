Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1AED4BB454
	for <lists+linux-omap@lfdr.de>; Fri, 18 Feb 2022 09:34:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232708AbiBRIe2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Feb 2022 03:34:28 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:40278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232712AbiBRIdy (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 18 Feb 2022 03:33:54 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B93CE31354;
        Fri, 18 Feb 2022 00:33:36 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 6194080AF;
        Fri, 18 Feb 2022 08:32:51 +0000 (UTC)
Date:   Fri, 18 Feb 2022 10:33:34 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Paul Barker <paul.barker@sancloud.com>
Cc:     Robert Nelson <robertcnelson@gmail.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: am335x-sancloud-bbe-extended-wifi: New
 devicetree
Message-ID: <Yg9Z3shxd+sA3bmF@atomide.com>
References: <20220216102430.500-1-paul.barker@sancloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220216102430.500-1-paul.barker@sancloud.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Paul Barker <paul.barker@sancloud.com> [220216 12:24]:
> Add support for the SanCloud BBE Extended WiFi board which shares common
> hardware with other BBE varients. Compared to the vanilla BBE, this
> particular model:
> 
>   * adds a WiFi+Bluetooth module connected via SDIO and UART.
> 
>   * drops the HDMI encoder, barometer and accelerometer.

Thanks applying into omap-for-v5.18/dt.

Tony
