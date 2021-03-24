Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD39934779C
	for <lists+linux-omap@lfdr.de>; Wed, 24 Mar 2021 12:45:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230346AbhCXLov (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 24 Mar 2021 07:44:51 -0400
Received: from muru.com ([72.249.23.125]:46460 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230316AbhCXLop (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 24 Mar 2021 07:44:45 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id DC6A48117;
        Wed, 24 Mar 2021 11:45:41 +0000 (UTC)
Date:   Wed, 24 Mar 2021 13:44:41 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Zheng Yongjun <zhengyongjun3@huawei.com>
Cc:     linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] bus: ti-sysc: Use kzalloc for allocating only one
 thing
Message-ID: <YFsmKYv2u2zFzpPe@atomide.com>
References: <20201229135147.23593-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201229135147.23593-1-zhengyongjun3@huawei.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Zheng Yongjun <zhengyongjun3@huawei.com> [201229 15:51]:
> Use kzalloc rather than kcalloc(1,...)

Thanks applying into omap-for-v5.13/ti-sysc.

Tony
