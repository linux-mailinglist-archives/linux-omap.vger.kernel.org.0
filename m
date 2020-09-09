Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1B742626EB
	for <lists+linux-omap@lfdr.de>; Wed,  9 Sep 2020 07:55:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725983AbgIIFzQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Sep 2020 01:55:16 -0400
Received: from muru.com ([72.249.23.125]:44310 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725807AbgIIFzQ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 9 Sep 2020 01:55:16 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 4866A80A4;
        Wed,  9 Sep 2020 05:55:15 +0000 (UTC)
Date:   Wed, 9 Sep 2020 08:55:52 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>, linux-omap@vger.kernel.org
Subject: Re: omap1 and __arch_pfn_to_dma
Message-ID: <20200909055552.GA2747@atomide.com>
References: <20200908092831.GA20123@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200908092831.GA20123@lst.de>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Christoph Hellwig <hch@lst.de> [200908 09:28]:
> Hi Aaro and Tony,
> 
> omap1 is the last arm platform implementing __arch_pfn_to_dma and
> __arch_dma_to_pfn.  Any chance you could help converting them to
> use the dma pfn offset in struct device [1] instead?

Sounds like a plan, however I don't have currently access to my omap1
devices and won't for about a month. Aaro care to look at this?

Regards,

Tony

> p1] which we are also reworking to support multiple ranges, but I
> can help with fixing that up easily
