Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 201CE92449
	for <lists+linux-omap@lfdr.de>; Mon, 19 Aug 2019 15:07:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727675AbfHSNHt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Aug 2019 09:07:49 -0400
Received: from 8bytes.org ([81.169.241.247]:50260 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726987AbfHSNHt (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 19 Aug 2019 09:07:49 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 02DF8309; Mon, 19 Aug 2019 15:07:47 +0200 (CEST)
Date:   Mon, 19 Aug 2019 15:07:45 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     iommu@lists.linux-foundation.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH] iommu/omap: Use the correct type for SLAB_HWCACHE_ALIGN
Message-ID: <20190819130745.GA2304@8bytes.org>
References: <20190816225837.6362-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190816225837.6362-1-s-anna@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Aug 16, 2019 at 05:58:37PM -0500, Suman Anna wrote:
>  drivers/iommu/omap-iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.
