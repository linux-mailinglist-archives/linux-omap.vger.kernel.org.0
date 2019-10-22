Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D9B1E08F1
	for <lists+linux-omap@lfdr.de>; Tue, 22 Oct 2019 18:34:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389444AbfJVQdu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 22 Oct 2019 12:33:50 -0400
Received: from muru.com ([72.249.23.125]:39096 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388591AbfJVQdt (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 22 Oct 2019 12:33:49 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 9BA1780FA;
        Tue, 22 Oct 2019 16:34:24 +0000 (UTC)
Date:   Tue, 22 Oct 2019 09:33:46 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-omap@vger.kernel.org, adam.ford@logicpd.com
Subject: Re: [PATCH] ARM: dts: logicpd-torpedo-37xx-devkit: Increase camera
 pixel clock
Message-ID: <20191022163346.GA5610@atomide.com>
References: <20191021210532.1590-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191021210532.1590-1-aford173@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Adam Ford <aford173@gmail.com> [191021 14:06]:
> The default settings used on the baseboard are good for the
> OMAP3530 and are compatible with the DM3730.  However, the
> DM3730 has a faster L3 clock which means the camera pixel clock
> can also be pushed faster as well.
> 
> This patch increase the Pixel clock to 90MHz which is the
> maximum the current ISP driver permits for an L3 clock
> of 200MHz.

Thanks applying into omap-for-v5.5/dt.

Tony
