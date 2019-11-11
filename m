Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A30F8F81E0
	for <lists+linux-omap@lfdr.de>; Mon, 11 Nov 2019 22:08:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726845AbfKKVIL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 11 Nov 2019 16:08:11 -0500
Received: from muru.com ([72.249.23.125]:41732 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726821AbfKKVIL (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 11 Nov 2019 16:08:11 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 105B48047;
        Mon, 11 Nov 2019 21:08:46 +0000 (UTC)
Date:   Mon, 11 Nov 2019 13:08:07 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-omap@vger.kernel.org, adam.ford@logicpd.com
Subject: Re: [PATCH] ARM: dts: logicpd-torpedo: Disable USB Host
Message-ID: <20191111210807.GB5610@atomide.com>
References: <20191108144025.25168-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191108144025.25168-1-aford173@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Adam Ford <aford173@gmail.com> [191108 06:41]:
> While the OMAP3 family has a USB Host controller, the Torpedo
> does not route the host pins off the board rendering it useless.
> 
> This patch removes the host references.

Applying into omap-for-v5.5/dt thanks.

Tony
