Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3E331CF96B
	for <lists+linux-omap@lfdr.de>; Tue, 12 May 2020 17:39:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726388AbgELPjn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 May 2020 11:39:43 -0400
Received: from muru.com ([72.249.23.125]:54062 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726055AbgELPjn (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 12 May 2020 11:39:43 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 754548047;
        Tue, 12 May 2020 15:40:32 +0000 (UTC)
Date:   Tue, 12 May 2020 08:39:40 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Ma Feng <mafeng.ma@huawei.com>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: omap2: make omap5_erratum_workaround_801819 static
Message-ID: <20200512153940.GJ37466@atomide.com>
References: <1589199704-11980-1-git-send-email-mafeng.ma@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589199704-11980-1-git-send-email-mafeng.ma@huawei.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Ma Feng <mafeng.ma@huawei.com> [200511 05:16]:
> Fix sparse warning:
> 
> arch/arm/mach-omap2/omap-smp.c:75:6: warning: symbol
> 'omap5_erratum_workaround_801819' was not declared. Should it be static?
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Ma Feng <mafeng.ma@huawei.com>

Applying into omap-for-v5.8/soc thanks.

Tony
