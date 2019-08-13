Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 374A28B6FB
	for <lists+linux-omap@lfdr.de>; Tue, 13 Aug 2019 13:33:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726298AbfHMLds (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 13 Aug 2019 07:33:48 -0400
Received: from muru.com ([72.249.23.125]:57174 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725953AbfHMLds (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 13 Aug 2019 07:33:48 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 131C3805C;
        Tue, 13 Aug 2019 11:34:15 +0000 (UTC)
Date:   Tue, 13 Aug 2019 04:33:45 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     linux-omap@vger.kernel.org, s-anna@ti.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] bus: ti-sysc: fixes for reset handling
Message-ID: <20190813113345.GP52127@atomide.com>
References: <1565181965-21039-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1565181965-21039-1-git-send-email-t-kristo@ti.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tero Kristo <t-kristo@ti.com> [190807 05:47]:
> Hi,
> 
> Here are a few patches to fix reset handling for ti-sysc bus driver.
> Without these, the iommu won't be working properly at least.

Applying these into omap-for-v5.4/ti-sysc since the prm rstctrl
driver is not yet merged and these should not be needed as fixes
at this point.

Regards,

Tony
