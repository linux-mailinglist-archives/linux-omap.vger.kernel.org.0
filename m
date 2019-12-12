Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E0EB11D329
	for <lists+linux-omap@lfdr.de>; Thu, 12 Dec 2019 18:07:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730005AbfLLRHc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Dec 2019 12:07:32 -0500
Received: from muru.com ([72.249.23.125]:46426 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729804AbfLLRHc (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 12 Dec 2019 12:07:32 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id B117880C0;
        Thu, 12 Dec 2019 17:08:11 +0000 (UTC)
Date:   Thu, 12 Dec 2019 09:07:29 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     zhengbin <zhengbin13@huawei.com>
Cc:     linux-omap@vger.kernel.org
Subject: Re: [PATCH -next v2] bus: ti-sysc: Use PTR_ERR_OR_ZERO() to simplify
 code
Message-ID: <20191212170729.GW35479@atomide.com>
References: <1574073452-23722-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1574073452-23722-1-git-send-email-zhengbin13@huawei.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* zhengbin <zhengbin13@huawei.com> [191118 02:31]:
> Fixes coccicheck warning:
> 
> drivers/bus/ti-sysc.c:506:1-3: WARNING: PTR_ERR_OR_ZERO can be used

Yeah OK so this removes few lines so applying into
omap-for-v5.6/ti-sysc thanks.

Tony
