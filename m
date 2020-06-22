Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BF1F203AB8
	for <lists+linux-omap@lfdr.de>; Mon, 22 Jun 2020 17:25:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729187AbgFVPZA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 22 Jun 2020 11:25:00 -0400
Received: from muru.com ([72.249.23.125]:58566 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729150AbgFVPY7 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 22 Jun 2020 11:24:59 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id B0D678140;
        Mon, 22 Jun 2020 15:25:51 +0000 (UTC)
Date:   Mon, 22 Jun 2020 08:24:56 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Oskar Enoksson <enok@lysator.liu.se>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        linux-omap@vger.kernel.org
Subject: Re: WL1271 on CM-T3730
Message-ID: <20200622152456.GJ37466@atomide.com>
References: <807d19b0-842f-87b9-c9ba-dcbfd4e7b108@lysator.liu.se>
 <AD238A83-22FC-458D-9180-F715AD6A5237@goldelico.com>
 <d32e2c17-849a-4aa8-7f84-a84d9699789a@lysator.liu.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d32e2c17-849a-4aa8-7f84-a84d9699789a@lysator.liu.se>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Oskar Enoksson <enok@lysator.liu.se> [200621 09:24]:
> Yes, it turned out that when I use the omap3-sbc-3730 devicetree then wifi
> starts up ok.

OK

> Maybe this should better be triggered by "compulab,omap3-cm-t3730" instead,
> since the wifi functionality has nothing to do with the t35 board?

Yes if it depends on just the SoC module board and not the sbc board.

Regards,

Tony
