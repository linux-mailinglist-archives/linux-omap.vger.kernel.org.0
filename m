Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C296A347769
	for <lists+linux-omap@lfdr.de>; Wed, 24 Mar 2021 12:31:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231375AbhCXLb0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 24 Mar 2021 07:31:26 -0400
Received: from muru.com ([72.249.23.125]:46430 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231401AbhCXLbR (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 24 Mar 2021 07:31:17 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id DEB538057;
        Wed, 24 Mar 2021 11:32:12 +0000 (UTC)
Date:   Wed, 24 Mar 2021 13:31:12 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Yang Li <yang.lee@linux.alibaba.com>
Cc:     p.zabel@pengutronix.de, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: ti-sysc: remove unneeded semicolon
Message-ID: <YFsjAPE82ZqhFOxH@atomide.com>
References: <1612249205-58955-1-git-send-email-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1612249205-58955-1-git-send-email-yang.lee@linux.alibaba.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Yang Li <yang.lee@linux.alibaba.com> [210202 09:00]:
> Eliminate the following coccicheck warning:
> ./drivers/bus/ti-sysc.c:1595:2-3: Unneeded semicolon
> ./drivers/bus/ti-sysc.c:2833:3-4: Unneeded semicolon

Thanks applying into omap-for-v5.13/ti-sysc.

Tony
