Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3988A22FA61
	for <lists+linux-omap@lfdr.de>; Mon, 27 Jul 2020 22:51:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726879AbgG0Uvf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 27 Jul 2020 16:51:35 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.219]:11297 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726320AbgG0Uvf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 27 Jul 2020 16:51:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1595883090;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:Message-Id:Cc:Date:From:Subject:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=GwtC4z8O9xd+htP8Gdu0ZH1k7XeNm9FKTpE9F9Glphs=;
        b=jjsyw6zyyWWpxViheJtOQAgJ4zc7rvMjW01SaVDe8Q8zRQ3CAZ3wTH7bmsCHT8V9ug
        Pvb2zPdchuw3jYdaKhKk/Z0qRKksCkeeemyyeRoxVWUPhc+EGNRd1RfipyIgJD525UcU
        aN8Tt5fEFID24su7VzDyk7t96+6DvJ4OGaD9uNKCK7XYqo24njf92ExJyClhAJIlqht8
        Fv+mbzZMBxyabro4s+PV7rLwuEU8MC1oDSwvUUh/1IRj4tE80YR4X3q/7n959yUOoet7
        tIGsgMMOXC5AfAg9OAYuaXYiU0V1/X4/58bJrmHw8AaM2KiIp2K96muee+BEpvJhVXE6
        1xAw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmMnw43qGZk="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
        with ESMTPSA id V07054w6RKpT9oS
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Mon, 27 Jul 2020 22:51:29 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: BUG: omap5: v5.8-rc7 boot fails
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
Date:   Mon, 27 Jul 2020 22:51:28 +0200
Cc:     Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
        kernel@pyra-handheld.com, Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Message-Id: <3FEECC44-3156-4786-8DF9-149F8CA9B41D@goldelico.com>
To:     Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,
after trying v5.8-rc7 the Pyra boot hangs after ca. 3 seconds
(a little random what the last log line is).

I could bisect it to:

6cfcd5563b4fadbf49ba8fa481978e5e86d30322 is the first bad commit
commit 6cfcd5563b4fadbf49ba8fa481978e5e86d30322
Author: Tony Lindgren <tony@atomide.com>
Date:   Mon Jul 13 09:26:01 2020 -0700

    clocksource/drivers/timer-ti-dm: Fix suspend and resume for am3 and am4

And a git revert makes it boot again.

I haven't had time to do more tests (e.g. with omap3/4 or on omap5uevm).

BR and thanks,
Nikolaus

