Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20A17E08B5
	for <lists+linux-omap@lfdr.de>; Tue, 22 Oct 2019 18:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730658AbfJVQXc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 22 Oct 2019 12:23:32 -0400
Received: from muru.com ([72.249.23.125]:39040 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729666AbfJVQXc (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 22 Oct 2019 12:23:32 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id DD0C680FA;
        Tue, 22 Oct 2019 16:24:06 +0000 (UTC)
Date:   Tue, 22 Oct 2019 09:23:29 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-omap@vger.kernel.org, adam.ford@logicpd.com
Subject: Re: [PATCH] ARM: dts: logicpd-torpedo: Disable Bluetooth Serial DMA
Message-ID: <20191022162329.GV5610@atomide.com>
References: <20191009192053.30255-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191009192053.30255-1-aford173@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Adam Ford <aford173@gmail.com> [191009 12:21]:
> The default serial driver for omap2plus is the 8250_omap driver.
> Unfortunately, this driver does not yet appear to have fully
> functional DMA on OMAP3630/DM3730 which causes some timeouts and
> frame errors.
> 
> This patch removes the DMA entry from the device tree which allow
> the UART to operate without Bluetooth frame errors. If/when DMA
> is working on OMAP3630, this should be reverted.

Applying into omap-for-v5.5/dt thanks.

Tony
