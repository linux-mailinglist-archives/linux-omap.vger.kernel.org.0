Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4754FE085B
	for <lists+linux-omap@lfdr.de>; Tue, 22 Oct 2019 18:11:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389219AbfJVQLX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 22 Oct 2019 12:11:23 -0400
Received: from muru.com ([72.249.23.125]:39008 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727309AbfJVQLX (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 22 Oct 2019 12:11:23 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 9C0CD80FA;
        Tue, 22 Oct 2019 16:11:58 +0000 (UTC)
Date:   Tue, 22 Oct 2019 09:11:20 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-omap@vger.kernel.org, adam.ford@logicpd.com
Subject: Re: [PATCH] configs: omap2plus: Enable VIDEO_MT9P031 module
Message-ID: <20191022161120.GT5610@atomide.com>
References: <20191007194913.14444-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191007194913.14444-1-aford173@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Adam Ford <aford173@gmail.com> [191007 12:49]:
> The Logic PD Torpedo Development Kit supports a Leopard Imaging
> camera based on the Aptina MT9P031 sensor.
> 
> This patch enables this to be built as a module.

Thanks applying into omap-for-v5.5/defconfig.

Tony
