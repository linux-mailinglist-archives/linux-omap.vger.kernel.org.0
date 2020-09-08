Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F9F6260EA8
	for <lists+linux-omap@lfdr.de>; Tue,  8 Sep 2020 11:28:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728925AbgIHJ2e (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Sep 2020 05:28:34 -0400
Received: from verein.lst.de ([213.95.11.211]:52252 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728705AbgIHJ2d (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 8 Sep 2020 05:28:33 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 7792768AFE; Tue,  8 Sep 2020 11:28:31 +0200 (CEST)
Date:   Tue, 8 Sep 2020 11:28:31 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org
Subject: omap1 and __arch_pfn_to_dma
Message-ID: <20200908092831.GA20123@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Aaro and Tony,

omap1 is the last arm platform implementing __arch_pfn_to_dma and
__arch_dma_to_pfn.  Any chance you could help converting them to
use the dma pfn offset in struct device [1] instead?

Thanks,
	Christoph

p1] which we are also reworking to support multiple ranges, but I
can help with fixing that up easily
