Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 336E24BB40C
	for <lists+linux-omap@lfdr.de>; Fri, 18 Feb 2022 09:21:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231655AbiBRIVf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Feb 2022 03:21:35 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:55704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230221AbiBRIVc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 18 Feb 2022 03:21:32 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 409192B3199
        for <linux-omap@vger.kernel.org>; Fri, 18 Feb 2022 00:21:17 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 13E6C80AF;
        Fri, 18 Feb 2022 08:20:32 +0000 (UTC)
Date:   Fri, 18 Feb 2022 10:21:15 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: am334x: pdu001: Use correct node name for RTC
Message-ID: <Yg9W+4NTsiG26ei2@atomide.com>
References: <20211220134139.683412-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211220134139.683412-1-thierry.reding@gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Thierry Reding <thierry.reding@gmail.com> [211220 15:42]:
> From: Thierry Reding <treding@nvidia.com>
> 
> RTC devices should be named "rtc" according to the standard RTC device
> tree schema.

Finally applying this one into omap-for-v5.18/dt, sorry for the delays.

Regards,

Tony
