Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E5E9C00F7
	for <lists+linux-omap@lfdr.de>; Fri, 27 Sep 2019 10:18:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbfI0IS6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 27 Sep 2019 04:18:58 -0400
Received: from mail-vk1-f196.google.com ([209.85.221.196]:44633 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726027AbfI0IS6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 27 Sep 2019 04:18:58 -0400
Received: by mail-vk1-f196.google.com with SMTP id j21so1029161vki.11;
        Fri, 27 Sep 2019 01:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=LkJDn6ibgbN4/9pWs1W9eHajworB/c/+Fplmk0dMkcw=;
        b=UBrBjlMTyQ648bspIoJgaMbZH9JbM7BC1g+A4L+FO4nF5LpE7KAR+jOFPpG5L55U2g
         j646BasiKzBZ00NpzmIVhcVWZF8tjYFfo7KF/6NM0cQDawxL3ZbNEBbmAgSZsGdbkzG7
         4ths5ZVPKJvaozzZrTeY85K6/ISSGBA/hgnQv1pqwaMwJASOeu7bnL3pQ8/DSpqQI2bk
         hH6GTn5cwSzNpjmlEW3mn3P7PjlqrsqEAT8g+qGAMinvTUGcjASpvLHW/v2Ie9jYJjZa
         rN78JyqVKcl6S0V4W8JrGAskH6YWh1T2UxJb36PcGfzBkUHypgDannKBTmR8Iu5jUnck
         yGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=LkJDn6ibgbN4/9pWs1W9eHajworB/c/+Fplmk0dMkcw=;
        b=bUxP+Ix5Jl562ZiZSgIpI5qk02uvh2i/o9F9Bn8wCoHCzMb6dmaqLfVE1h7NJsPyYe
         sKKYsGP7jUQ80CwG0Vd/JUVSEkzjJ55KSIsvdDvu/844AlnnbObbo17FHefIPLk9VZ/z
         J82H01hDkXUh9bP/pWB77rlzqqQLEZQ8Ixqy3HV5fhrCKoxG3RYruSsQlKvnZbW2QooK
         RxjEXrvR+ChTTVp/2lypaZuS2j5aGGzw3Y2byVj3EkaE4/8QzbZoCnthTku1yh7CXJzw
         OGf6xO/qWQ20FvtRCk/Yp2bKn6f+LcwuEvpCTeL8U+HbtFYLG6e0ONSLZ2LlS0Ed8IYU
         sUXA==
X-Gm-Message-State: APjAAAUAYxy+TQxuy020qBTmFB/KhuW7xIoiyuQLJh3nH3xoHWGsXg9a
        RsIHDHdebCNuEVQwOZDRPTNsx/40gwgrYh/TTJqAHz+MWbw=
X-Google-Smtp-Source: APXvYqyNhZeXXSjGF3QhP6DSX+R7WJSLFPVJqg+aGBiHxxmVzGYIzj1eEvkUAHgfPFClZJXktAzdex5eSZieBJa4030=
X-Received: by 2002:a1f:a4c5:: with SMTP id n188mr3958522vke.11.1569572335654;
 Fri, 27 Sep 2019 01:18:55 -0700 (PDT)
MIME-Version: 1.0
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Fri, 27 Sep 2019 10:18:41 +0200
Message-ID: <CAGm1_kuK6aA1ew9ZY-fVDUE+o71u1QaSg0kfX2jWUWE9Me8Tjg@mail.gmail.com>
Subject: musb: cppi41: broken high speed FTDI functionality when connected to
 musb directly
To:     linux-omap@vger.kernel.org
Cc:     Tony Lindgren <tony@atomide.com>, vkoul@kernel.org,
        Bin Liu <b-liu@ti.com>, linux-usb <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

I was porting my system from 3.18/4.2 to 5.3. During this process I
noticed that FT4232 that is attached directly to musb is not working
correctly when opened for the first time: tx is working but nothing
can be received. On the second opening everything is working fine.
When the same chip is connected via a USB hub - everything is working
from the very beginning.

I could reproduce this issue using BeagleBone Black with omap2plus_defconfig.

# lsusb -t
+/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=musb-hdrc/1p, 480M
    |__ Port 1: Dev 2, If 0, Class=, Driver=ftdi_sio, 480M
    |__ Port 1: Dev 2, If 1, Class=, Driver=ftdi_sio, 480M
    |__ Port 1: Dev 2, If 2, Class=, Driver=ftdi_sio, 480M
    |__ Port 1: Dev 2, If 3, Class=, Driver=ftdi_sio, 480M

git bisect revealed the following:

fdea2d09b997ba4c86e7a707a5fac87c305f2131 is the first bad commit
commit fdea2d09b997ba4c86e7a707a5fac87c305f2131
Author: Tony Lindgren <tony@atomide.com>
Date:   Wed Aug 31 07:19:59 2016 -0700

    dmaengine: cppi41: Add basic PM runtime support

    Let's keep the device enabled between cppi41_dma_issue_pending()
    and dmaengine_desc_get_callback_invoke() and rely on the PM runtime
    autoidle timeout elsewhere.

    As the PM runtime is for whole device, not for each channel,
    we need to queue pending transfers if the device is PM runtime
    suspended. Then we start the pending transfers in PM runtime
    resume.

    Signed-off-by: Tony Lindgren <tony@atomide.com>
    Signed-off-by: Vinod Koul <vinod.koul@intel.com>

:040000 040000 8cf92c09083541dfdee01cc2973e73ef520f4fb1
a03c1a7ba8e723f7b503733c46edaa4141483265 M      drivers

Any idea?

Thanks.

Best regards,
Yegor
