Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 273FBDF3A1
	for <lists+linux-omap@lfdr.de>; Mon, 21 Oct 2019 18:53:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728476AbfJUQvH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Oct 2019 12:51:07 -0400
Received: from muru.com ([72.249.23.125]:38436 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726276AbfJUQvG (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 21 Oct 2019 12:51:06 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 3410280CC;
        Mon, 21 Oct 2019 16:51:41 +0000 (UTC)
Date:   Mon, 21 Oct 2019 09:51:03 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-omap@vger.kernel.org, adam.ford@logicpd.com
Subject: Re: [PATCH] ARM: dts: logicpd-torpedo-baseboard: Reduce video
 regulator chatter
Message-ID: <20191021165103.GW5610@atomide.com>
References: <20190917154923.1073-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190917154923.1073-1-aford173@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Adam Ford <aford173@gmail.com> [190917 08:50]:
> The dss driver wants two regulators or it dump some splat while
> initializing.  This patch adds a reference to the second regulator
> which to avoid the warnings that the regulator is missing.

Thanks applying into omap-for-v5.5/dt.

Tony
