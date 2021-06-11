Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE36E3A3D08
	for <lists+linux-omap@lfdr.de>; Fri, 11 Jun 2021 09:24:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbhFKH04 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Jun 2021 03:26:56 -0400
Received: from muru.com ([72.249.23.125]:41770 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230233AbhFKH0z (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 11 Jun 2021 03:26:55 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id D43C080BA;
        Fri, 11 Jun 2021 07:25:06 +0000 (UTC)
Date:   Fri, 11 Jun 2021 10:24:55 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Zhang Qilong <zhangqilong3@huawei.com>
Cc:     linux-omap@vger.kernel.org
Subject: Re: [PATCH -next] bus: ti-sysc: using pm_runtime_resume_and_get
 instead of pm_runtime_get_sync
Message-ID: <YMMPx6KqjXlkqPym@atomide.com>
References: <20210531142542.31158-1-zhangqilong3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210531142542.31158-1-zhangqilong3@huawei.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Zhang Qilong <zhangqilong3@huawei.com> [210531 17:11]:
> Using pm_runtime_resume_and_get is more appropriate
> for simplifing code.

Thanks applying into omap-for-v5.14/ti-sysc.

Tony
