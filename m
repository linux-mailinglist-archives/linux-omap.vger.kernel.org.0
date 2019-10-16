Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 853F2D99CC
	for <lists+linux-omap@lfdr.de>; Wed, 16 Oct 2019 21:15:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394354AbfJPTPG convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-omap@lfdr.de>); Wed, 16 Oct 2019 15:15:06 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:34136 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731321AbfJPTPG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 16 Oct 2019 15:15:06 -0400
Received: from surfer-172-29-2-69-hotspot.internet-for-guests.com (p2E5701B0.dip0.t-ipconnect.de [46.87.1.176])
        by mail.holtmann.org (Postfix) with ESMTPSA id B5F1BCECDD;
        Wed, 16 Oct 2019 21:24:02 +0200 (CEST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3594.4.19\))
Subject: Re: [PATCHv2 4/4] Bluetooth: btwilink: drop superseded driver
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20191003134147.9458-5-sre@kernel.org>
Date:   Wed, 16 Oct 2019 21:15:03 +0200
Cc:     Tony Lindgren <tony@atomide.com>, Adam Ford <aford173@gmail.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        linux-bluetooth@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Transfer-Encoding: 8BIT
Message-Id: <BC1F82AC-2988-4BC6-99EA-1C9F9289E582@holtmann.org>
References: <20191003134147.9458-1-sre@kernel.org>
 <20191003134147.9458-5-sre@kernel.org>
To:     Sebastian Reichel <sre@kernel.org>
X-Mailer: Apple Mail (2.3594.4.19)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Sebastian,

> All users of this driver have been converted to the serdev based
> hci_ll driver. The unused driver can be safely dropped now.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
> drivers/bluetooth/Kconfig    |  11 --
> drivers/bluetooth/Makefile   |   1 -
> drivers/bluetooth/btwilink.c | 337 -----------------------------------
> 3 files changed, 349 deletions(-)
> delete mode 100644 drivers/bluetooth/btwilink.c

patch has been applied to bluetooth-next tree.

However what I really like to see is that you re-introduce a btwilink driver that is purely serdev based and doesn’t rely on any hci_uart/hci_ldisc code. A clean serdev only driver is that best and easier to maintain long term.

Regards

Marcel

