Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B35EDFD34
	for <lists+linux-omap@lfdr.de>; Tue, 30 Apr 2019 17:50:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725950AbfD3Pup (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 30 Apr 2019 11:50:45 -0400
Received: from muru.com ([72.249.23.125]:47668 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725930AbfD3Puo (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 30 Apr 2019 11:50:44 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id D1AF280FB;
        Tue, 30 Apr 2019 15:51:01 +0000 (UTC)
Date:   Tue, 30 Apr 2019 08:50:41 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-omap@vger.kernel.org, adam.ford@logicpd.com
Subject: Re: [PATCH] ARM: dts: logicpd-som-lv: Fix MMC1 card detect
Message-ID: <20190430155041.GH8007@atomide.com>
References: <20190430124744.18993-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190430124744.18993-1-aford173@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Adam Ford <aford173@gmail.com> [190430 05:48]:
> The card detect pin was incorrectly using IRQ_TYPE_LEVEL_LOW
> instead of GPIO_ACTIVE_LOW when reading the state of the CD pin.
> 
> This was previosly fixed on Torpedo, but missed on the SOM-LV
> 
> Fixes: 5cb8b0fa55a9 ("ARM: dts: Move most of
> logicpd-som-lv-37xx-devkit.dts to logicpd-som-lv-baseboard.dtsi")

Applying into fixes thanks.

Tony
