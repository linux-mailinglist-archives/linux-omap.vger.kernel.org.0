Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A7B81F883E
	for <lists+linux-omap@lfdr.de>; Sun, 14 Jun 2020 11:56:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726014AbgFNJ4D (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 14 Jun 2020 05:56:03 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:44885 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725265AbgFNJ4C (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 14 Jun 2020 05:56:02 -0400
Received: from linux-5fgm.suse ([79.250.176.52]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MTAJl-1jLI0F2mqd-00UWVr for <linux-omap@vger.kernel.org>; Sun, 14 Jun 2020
 11:56:00 +0200
From:   Matthias Welwarsky <linux-omap@welwarsky.de>
To:     linux-omap@vger.kernel.org
Subject: omap dmtimer driver bug and a silicon issue on TI AM3358
Date:   Sun, 14 Jun 2020 11:56:00 +0200
Message-ID: <2019546.2yLtp7J43K@linux-5fgm.suse>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Provags-ID: V03:K1:VAUuWub6qB5MdntR8MY0KMMpXPbbUZpGfZQE7m4jcNUnoYW+x2M
 ijATK8DpHQbzZDUrmRTd6Bddd145WtYSTcObvdM57UoJSaPqdsU+q3HOhiOVSxTvF2j4CBs
 70RqlZjSGoEonp8P0snE7uRMPujUh8zffwfNMxMNOKh0H9usSWgWqJvUyFbl0hlRRbfCuNF
 tQ6kACitRWlB6+bJaMqGw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:SXePJmUv2xM=:xnArzl+lau4C5wM4CTFOVj
 flrEM66jSC0QQjRVZ1oeYEo0mcrk+TZJ8Htj6UoSm5I8MTf2mAybeWOJFHfHvFtefT6F1m5bb
 15TJU4nEAyY5/ya2nUo0sP8uMzVWT7tBhYjgOXlbY/P0LaKTA1y9xksvIcHo3JidWBnWVDqMO
 3dX6oq/VHgKcsK08mkiEUY8JbAn30NyHqh24MNFGFxXs/xYKdQ/TC6S31qqKW7WXu4r/lg66n
 R4Zq8NBvuzHcn9Mh6gtCbxnSqzslKu1gt06Aqgn57ffUDHYYzpcZiS8wpTgT7G2EZNKxrcbh9
 L/ahKkrafZJQbPLtxXeJILXl7LwziPjFOEycXxhm6WS96XMUILtHYkzo3S6kUlkICRo6jm6lG
 48L24OwN/sMYr+0yFAvdBZ5DyzqR3O/mP0S+MpqPXzJnD9D/77pE/AtuWyFVw+8KhtZbFCTP6
 Lyg02JLe22qZ/WAMoDdbVolr6TKcbYi9n5b/zuEC0jgTXrnmZXv9/0f30qTxs21OIqImWRQtv
 w9xd04OrFfDJBoiM6Ogbf/k3mrP9ldtkTvVoN9/NlbMeKj8mjg13dZ82Biu0Qmjn9s9GjH3md
 htAegwMkaFRa/8BDCEXPIwQtlWkEg5Unr1Q98mX17tHBKwq9XjNJLEWMZySddATFOOkxG6RAR
 Sg2ZRlI5yjAmtWktS92/FdDpPuy6eIw6eB7WhPsiNONjub8RT1dQL8JfDsb8QI8K154SuS9Bq
 OYV+0/4aSG36mN1QFHV2qJptEDb2X+2vXwds12VKOqcSA0WwJx+Qc9OkcN1/GqqPVRXkZX9U6
 vDm5IhqOR5ddqlBIi+zwwtNOKUfq1V9mxiDx4YN5rZSxjatKoDX4j/3liCpSn5mCi4RbeW0
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

while doing some timekeeping experiments with the Beaglebone Black I ran 
across two issues I'd like advice on before submitting patches.

I'm feeding one of the dmtimers with a external clock (10MHz from a GPSDO) to 
improve drift behaviour of CLOCK_REALTIME. For this, I need to set the input 
clock multiplexer of one of the dmtimers to "tclkin_ck". I also need to set up 
the pin multiplexing so that the external clock is actually available.

The first issue is the framework function omap_dm_timer_set_source(). Of the 
available clock sources, none is a possible parent. But even when fixing them, 
the clk_set_parent() will fail because timer->fclk points to the "wrong" clock 
in the clock topology. You can only set the parent clock of the "timerN_fclk" 
nodes, but timer->fclk points to the actual hardware clock one level "down" in 
the topology. This clock only has one possible parent, which is "timerN_fck". 
The work-around I use in my clocksource driver is to use the clock framework 
directly and manually retrieve the parent clock of timer->fclk, then reparent 
that clock to "tclkin_ck". That works, but I'd prefer to fix the driver 
framework. But I'd need a hint what would be an appropriate approach for that.

The second issue is more of a silicon "bug". It seems that the clock 
multiplexer is not warm-reset sensitive but the pinmux is. In consequence, 
when the chip is reset (watchdog or "reboot" command), the pinmux defaults 
back to GPIO but the timer functional clock mux still points to "tclkin_ck" 
and when the kernel boots up and the dmtimer framework tries to initialize the 
timer, it accesses a hwmod that has no functional clock and the kernel 
receives an async external abort and dies. 

Two possible places for a fix come to mind: u-boot could reset the clock mux, 
or the kernel needs to do it when it boots, either in the dmtimer framework or 
in the clock framework, maybe based on a device tree attribute that specifies 
a default state of the clock mux.

I'd like to hear your take on this.

BR,
Matthias



