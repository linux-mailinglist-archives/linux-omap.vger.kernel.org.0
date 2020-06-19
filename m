Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 836F320121C
	for <lists+linux-omap@lfdr.de>; Fri, 19 Jun 2020 17:52:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405330AbgFSPsM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 19 Jun 2020 11:48:12 -0400
Received: from utopia.booyaka.com ([74.50.51.50]:37698 "EHLO
        utopia.booyaka.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393431AbgFSPZc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 19 Jun 2020 11:25:32 -0400
X-Greylist: delayed 401 seconds by postgrey-1.27 at vger.kernel.org; Fri, 19 Jun 2020 11:25:32 EDT
Received: (qmail 29577 invoked by uid 1019); 19 Jun 2020 15:18:50 -0000
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 19 Jun 2020 15:18:50 -0000
Date:   Fri, 19 Jun 2020 15:18:50 +0000 (UTC)
From:   Paul Walmsley <paul@pwsan.com>
To:     Chen Tao <chentao107@huawei.com>
cc:     tony@atomide.com, linux@armlinux.org.uk,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: OMAP2+: Fix possible memory leak in
 omap_hwmod_allocate_module
In-Reply-To: <20200619104240.55978-1-chentao107@huawei.com>
Message-ID: <alpine.DEB.2.21.999.2006191518380.26224@utopia.booyaka.com>
References: <20200619104240.55978-1-chentao107@huawei.com>
User-Agent: Alpine 2.21.999 (DEB 260 2018-02-26)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, 19 Jun 2020, Chen Tao wrote:

> Fix memory leak in omap_hwmod_allocate_module not freeing in
> handling error path.
> 
> Fixes: 8c87970543b17("ARM: OMAP2+: Add functions to allocate module data from device tree")
> Signed-off-by: Chen Tao <chentao107@huawei.com>

Reviewed-by: Paul Walmsley <paul@pwsan.com>

- Paul
