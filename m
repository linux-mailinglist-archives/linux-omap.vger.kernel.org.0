Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AE23314319
	for <lists+linux-omap@lfdr.de>; Mon,  8 Feb 2021 23:39:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230027AbhBHWjC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Feb 2021 17:39:02 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:39686 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbhBHWjB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 8 Feb 2021 17:39:01 -0500
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1612823899;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=oYlVExh8VX0pz57F6MiWUgOYPKOwByipvE/Q5oPx108=;
        b=r/s6nsTHQ6t3RiQrvC0zXyHPJTUafSzZ8l5wSBKSD5yjYCloH1SScX73LgwR6M8abp0rMT
        cI6wDVU3Ba6EFU5Od/SuU0k2hbKuGNnRgrRsqDuFZm7SvCnME2V2hNL3aJ88MGRlMua60q
        nbQY1675P2AAypIJi+jyxP9lVxnEeJ5detWOJztsWyocVDmZNyOqFQgWnN88XoV8egCKCR
        LF731RFD40cB89r5ycA4tGg1p5OuVpP17S1SBL3bzfZNuq2S76b5E856BC2HErdFw2ygGp
        280bF9YDEpEg+B+/Pns3WZf/bQ0I7ND7CkJfpDq53nuu96xkFHgYuHz5RfzBoA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1612823899;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=oYlVExh8VX0pz57F6MiWUgOYPKOwByipvE/Q5oPx108=;
        b=mfCp0LBMuvAQS037Wg1z0a7lWj9nJ5aw64jFNQuZxdmpZz/SQDjUzP5m2Ar12sYFCoAT8s
        2TYnfGJlJ3JpZWBw==
To:     linux-fbdev@vger.kernel.org
Cc:     dri-devel@lists.freedesktop.org,
        Russell King <linux@armlinux.org.uk>,
        linux-omap@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 0/3] video: Remove in_interrupt() usage.
Date:   Mon,  8 Feb 2021 23:38:07 +0100
Message-Id: <20210208223810.388502-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Folks,

in the discussion about preempt count consistency across kernel
configurations:

 https://lore.kernel.org/r/20200914204209.256266093@linutronix.de/

it was concluded that the usage of in_interrupt() and related context
checks should be removed from non-core code.

In the long run, usage of 'preemptible, in_*irq etc.' should be banned from
driver code completely.

This series targets the video subsystem. The omap patches are a repost
of [0], the amba-clcd is new after I received no feedback on my analysis
[1].

[0] https://lkml.kernel.org/r/20210127172902.145335-1-bigeasy@linutronix.de
[1] https://lkml.kernel.org/r/20210127174408.ududpwfrbg3dhyxj@linutronix.de

Sebastian


