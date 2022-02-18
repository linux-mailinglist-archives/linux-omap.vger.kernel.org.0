Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02D594BB426
	for <lists+linux-omap@lfdr.de>; Fri, 18 Feb 2022 09:28:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232495AbiBRI25 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Feb 2022 03:28:57 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:51846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231165AbiBRI25 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 18 Feb 2022 03:28:57 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AA6D717044
        for <linux-omap@vger.kernel.org>; Fri, 18 Feb 2022 00:28:40 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 74CB780AF;
        Fri, 18 Feb 2022 08:27:55 +0000 (UTC)
Date:   Fri, 18 Feb 2022 10:28:38 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Romain Naour <romain.naour@smile.fr>
Cc:     linux-omap@vger.kernel.org
Subject: Re: [PATCH] drivers/thermal/ti-soc-thermal: Add hwmon support
Message-ID: <Yg9YtqxqzvUHbKfN@atomide.com>
References: <20220216172206.7448-1-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220216172206.7448-1-romain.naour@smile.fr>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Romain Naour <romain.naour@smile.fr> [220216 17:21]:
> Expose ti-soc-thermal thermal sensors as HWMON devices.

Can you please send this to the ti-soc-thermal maintainer(s)
and related subsystem mailing list with linux-omap in Cc?
See the MAINTAINERS file for info and scripts/get-maintainer.pl
script.

Then the subsystem maintainer(s) will pick it up, or will
ack it and I can pick it up.

Regards,

Tony
