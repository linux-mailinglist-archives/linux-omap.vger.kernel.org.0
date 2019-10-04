Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9643CCB7C9
	for <lists+linux-omap@lfdr.de>; Fri,  4 Oct 2019 12:02:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730053AbfJDKCS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Oct 2019 06:02:18 -0400
Received: from mail-io1-f51.google.com ([209.85.166.51]:36262 "EHLO
        mail-io1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726927AbfJDKCS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 4 Oct 2019 06:02:18 -0400
Received: by mail-io1-f51.google.com with SMTP id b136so12272048iof.3;
        Fri, 04 Oct 2019 03:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=zVzaL13aBMw0U8JG2NOEmJnjPxX8zMVFzGvL8Tcw4zE=;
        b=QMWp6/G+6FQ1g1EQynFBy9qWtAZZvbEl3vOY2ZedehHYyxKZxM/Eonl4lW4ykcXIC9
         3kiJdmKWs3Q8Z/0PPZNV7FfF+lkzhC7tyZp5I3lgBnlk2/dx0jCtyxFuUP4Kq3q+UaV9
         j2zrTEBpydXkC24ZBOnRVqg8olG2y1m5ntg+ouIBV18wnKLvdHTJ1aSe0LOrqXlPBRMg
         foVktVWwiAPyFKX202xdxFE1O3kdUG2v59sGkmod4c92aICgMbdfr3t/6fwCY/60fxD/
         XUFu2W2PvCyn4JFcZUizrR5n4vGtTn3UgiVAkGHeJMU2jVoSr8F2M0+F6HsBwLf42ngb
         vg8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=zVzaL13aBMw0U8JG2NOEmJnjPxX8zMVFzGvL8Tcw4zE=;
        b=Pa8Iea1+rBsZKbGTf2sy8N82+lgIjLJVCeZQ6SpiG2DyyDZrua0XQS3pXYN+xhIGBW
         anSqK1hTFzrgH6XOYqdOLzxor+T+G4MMfdLj3NLmNrUzNUaDmaGJXJ2HBOi8nkCphU8M
         lkkkLrGy98NSEMelfwqdTWg0gNQuCYPAv26BERjsV0Qe365BuEpI5glcfkYG5faA4jty
         j/9MxbNtnUygAr7nC726icOXNZn4Ghvf3FnrK7GFKteLE570gDcs4vYMgr1K4XuWk+ib
         poh+u1biin+Pd3/Jys4dbtXvmLcgidH8OJ5ex5F6tZD8Uv+pmChLO/I2mE9R5ToGZCKc
         bSLw==
X-Gm-Message-State: APjAAAWGzyOPD1jUVqhW0ofvcmcKB1kW7uRiPc68mekQ8+LUUI7G6bot
        3Ery/jKeKLEoGyO2Vx69AgUV+s3lR6/zoGjwXIY=
X-Google-Smtp-Source: APXvYqzMrdeHLGJcpBa6sb2EAlzKy/w8w1xOVCGpGNdUkhtzyFrrOpSnqNRE8cnlYFCtBJxxnh89exYjDJhjAyKlo4M=
X-Received: by 2002:a05:6638:3a5:: with SMTP id z5mr13854093jap.95.1570183337214;
 Fri, 04 Oct 2019 03:02:17 -0700 (PDT)
MIME-Version: 1.0
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 4 Oct 2019 05:02:05 -0500
Message-ID: <CAHCN7xLO5VgA6tW4p7QjwPv_QXv==zbC38TxXtsR5x9H0mUGJA@mail.gmail.com>
Subject: DM3730 Bluetooth Performance differences between SERIAL_8250_OMAP vs SERIAL_OMAP
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, linux-serial@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Vignesh R <vigneshr@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

I am running Kernel 5.3.2 trying to troubleshoot some intermittent
Bluetooth issues, and I think I have narrowed it down to the serial
driver in use.
By default, omap2plus_defconfig enables both SERIAL_8250_OMAP and
SERIAL_OMAP.  I have my console device configured as  ttyS0, and all
appears fine.  When I enable Bluetooth, however, I get intermittent
errors on an DM3730 / OMAP3630.

Using the 8250 driver for Blueotooth I get intermittent frame errors
and data loss.

Scanning ...
[   28.482452] Bluetooth: hci0: Frame reassembly failed (-84)
[   36.162170] Bluetooth: hci0: Frame reassembly failed (-84)
        F4:4E:FC:C9:2F:57       BluJax
# l2ping F4:4E:FC:C9:2F:57
Ping: F4:4E:FC:C9:2F:57 from 00:18:30:49:7D:63 (data size 44) ...
44 bytes from F4:4E:FC:C9:2F:57 id 0 time 8.27ms
no response from F4:4E:FC:C9:2F:57: id 1
^C2 sent, 1 received, 50% loss

(after a fairly long hang, I hit control-c)

However, disabling the 8250 driver and using the only SERIAL_OMAP and
the console routed to ttyO0, the Bluetooth works well, so I believe it
to be a serial driver issue and not a Bluetooth error.

# hcitool scan
Scanning ...
        F4:4E:FC:C9:2F:57       BluJax
^C
# l2ping F4:4E:FC:C9:2F:57
Ping: F4:4E:FC:C9:2F:57 from 00:18:30:49:7D:63 (data size 44) ...
44 bytes from F4:4E:FC:C9:2F:57 id 0 time 6.90ms
...
44 bytes from F4:4E:FC:C9:2F:57 id 14 time 28.29ms
^C15 sent, 15 received, 0% loss
#

0% loss and regular, repeatable communication without any Frame
reassembly errors.

Any suggestions on how to troubleshoot or what might cause the
difference between the two drivers?

adam
