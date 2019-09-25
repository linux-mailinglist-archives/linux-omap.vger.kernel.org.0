Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9429BE305
	for <lists+linux-omap@lfdr.de>; Wed, 25 Sep 2019 19:05:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407597AbfIYRFU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 25 Sep 2019 13:05:20 -0400
Received: from verein.lst.de ([213.95.11.211]:59367 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2407542AbfIYRFU (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 25 Sep 2019 13:05:20 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id D96AB68B02; Wed, 25 Sep 2019 19:05:16 +0200 (CEST)
Date:   Wed, 25 Sep 2019 19:05:16 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Keerthy <j-keerthy@ti.com>
Cc:     arnd@arndb.de, nsekhar@ti.com, olof@lixom.net, t-kristo@ti.com,
        catalin.marinas@arm.com, will@kernel.org, tony@atomide.com,
        s-anna@ti.com, hch@lst.de, bjorn.andersson@linaro.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 linux-next 0/4] arm/arm64: configs: Convert all
 CONFIG_REMOTEPROC instances to y
Message-ID: <20190925170516.GA16678@lst.de>
References: <20190920075946.13282-1-j-keerthy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190920075946.13282-1-j-keerthy@ti.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Thanks Keerthy,

the patches look good to me:

Acked-by: Christoph Hellwig <hch@lst.de>
