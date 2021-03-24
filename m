Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 772DF347774
	for <lists+linux-omap@lfdr.de>; Wed, 24 Mar 2021 12:34:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230115AbhCXLeV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 24 Mar 2021 07:34:21 -0400
Received: from muru.com ([72.249.23.125]:46444 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229839AbhCXLdt (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 24 Mar 2021 07:33:49 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id D69738117;
        Wed, 24 Mar 2021 11:34:45 +0000 (UTC)
Date:   Wed, 24 Mar 2021 13:33:45 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Yang Li <yang.lee@linux.alibaba.com>
Cc:     bcousson@baylibre.com, paul@pwsan.com, linux@armlinux.org.uk,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: OMAP2+: add missing call to of_node_put()
Message-ID: <YFsjmbIL9p4m/sck@atomide.com>
References: <1614243290-47105-1-git-send-email-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614243290-47105-1-git-send-email-yang.lee@linux.alibaba.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Yang Li <yang.lee@linux.alibaba.com> [210225 10:55]:
> In one of the error paths of the for_each_child_of_node() loop,
> add missing call to of_node_put().

Thanks applying into omap-for-v5.13/soc.

Tony
