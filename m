Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED92A20CAFB
	for <lists+linux-omap@lfdr.de>; Mon, 29 Jun 2020 00:44:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726213AbgF1Wo2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 28 Jun 2020 18:44:28 -0400
Received: from sender11-of-o52.zoho.eu ([31.186.226.238]:21682 "EHLO
        sender11-of-o52.zoho.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgF1Wo2 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 28 Jun 2020 18:44:28 -0400
X-Greylist: delayed 903 seconds by postgrey-1.27 at vger.kernel.org; Sun, 28 Jun 2020 18:44:27 EDT
ARC-Seal: i=1; a=rsa-sha256; t=1593383359; cv=none; 
        d=zohomail.eu; s=zohoarc; 
        b=UbFJfL8AIw9TIVeNAbQwHsQGvz4nxeasT+tic57EB9CAiAFR0T0jnjj5Hgx5zkfsynQEjmDBYlFlDASrIOR0lJ+6i1mzo1B1T2IBt3JceYL3vvp/jnWpg+7lnBnaXcLSI7KCbjH0noTr24Jo7LIMnvL6rLvOt7hVk2RlQfRnbDg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
        t=1593383359; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=eJXBsdQxI+QKmwFpNs6KEILV67s05T9HlStX1t4AduI=; 
        b=h+xLdj/jcf9fH+DhMNx4JIQ/lCrwVKJlUUyr2cMZfKKvctoHCbMinGbmB3+VGjz5zNxfcPof4hWE6pC/989zSGyy4Q2XUB395IsD6BWNp0I1aLDG7C0Q8rm/vt0rt79niCmKKlpGPE2hPDpJY+yNkZO0HO6+xmAnESC9oYXqei0=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
        spf=pass  smtp.mailfrom=devnull@uvos.xyz;
        dmarc=pass header.from=<devnull@uvos.xyz> header.from=<devnull@uvos.xyz>
Received: from localhost.localdomain (ip-95-222-212-254.hsi15.unitymediagroup.de [95.222.212.254]) by mx.zoho.eu
        with SMTPS id 1593383357669652.056222888556; Mon, 29 Jun 2020 00:29:17 +0200 (CEST)
Date:   Mon, 29 Jun 2020 00:29:17 +0200
From:   Dev Null <devnull@uvos.xyz>
To:     sre@kernel.org
Cc:     linux-omap@vger.kernel.org
Subject: [bug report] Droid 4 cpcap rtc
Message-Id: <20200629002917.0a2045380a0fe022f852e067@uvos.xyz>
Organization: UVOS Organization
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Sebastian

Im a droid 4 user / maemo leste dev. I would like to bring these things to your attention:

1. writing to the rtc via rtc-cpcap with hwclock appears to not work at all.
	- see https://github.com/maemo-leste/bugtracker/issues/399
	- hwclock: ioctl(RTC_SET_TIME) to /dev/rtc0 to set the time failed: Numerical result out of range
2. do you by any chance know how the RGB -> RGWRBW pentile color conversion happens on the droid 4? is this handled in hardware or in software or in firmware somewere?

-- 
Dev Null <devnull@uvos.xyz>
