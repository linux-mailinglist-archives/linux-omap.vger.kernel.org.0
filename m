Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D16FE392DC0
	for <lists+linux-omap@lfdr.de>; Thu, 27 May 2021 14:13:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234091AbhE0MPN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 27 May 2021 08:15:13 -0400
Received: from muru.com ([72.249.23.125]:32852 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235050AbhE0MPB (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 27 May 2021 08:15:01 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id C958D80A8;
        Thu, 27 May 2021 12:13:33 +0000 (UTC)
Date:   Thu, 27 May 2021 15:13:24 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Suman Anna <s-anna@ti.com>
Cc:     Jassi Brar <jaswinder.singh@linaro.org>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/4] Cleanup OMAP Mailbox nodes for YAML binding
Message-ID: <YK+M5FhAU7pxANSW@atomide.com>
References: <20210518173645.12270-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210518173645.12270-1-s-anna@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Suman Anna <s-anna@ti.com> [210518 20:37]:
> Hi Tony,
> 
> The following series is minor cleanups in the OMAP Mailbox nodes
> on various OMAP2+ SoCs. The changes are to bring the nodes in
> compliance with the OMAP Mailbox YAML binding conversion [1]. The
> changes can be applied independent of the YAML conversion, and
> all the dtbs_check warnings around Mailbox nodes should be gone
> once all the dts patches and binding conversion are merged.

Applying into omap-for-v5.14/dt thanks,

Tony
