Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCE937B68E0
	for <lists+linux-omap@lfdr.de>; Tue,  3 Oct 2023 14:21:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231250AbjJCMVo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 Oct 2023 08:21:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230404AbjJCMVn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 3 Oct 2023 08:21:43 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A774CAC;
        Tue,  3 Oct 2023 05:21:39 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 1C32680A7;
        Tue,  3 Oct 2023 12:21:39 +0000 (UTC)
Date:   Tue, 3 Oct 2023 15:21:37 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Dhruva Gole <d-gole@ti.com>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        John Ogness <john.ogness@linutronix.de>,
        Johan Hovold <johan@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-omap@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v12 1/1] serial: core: Start managing serial controllers
 to enable runtime PM
Message-ID: <20231003122137.GC34982@atomide.com>
References: <20230525113034.46880-1-tony@atomide.com>
 <62d3678a-a23d-4619-95de-145026629ba8@gmail.com>
 <20231003121455.GB34982@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231003121455.GB34982@atomide.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [231003 12:15]:
> Hi,
> 
> * Maximilian Luz <luzmaximilian@gmail.com> [231003 11:57]:
> > A bad workaround is to disable runtime PM, e.g. via
> > 
> >   echo on > /sys/bus/serial-base/devices/dw-apb-uart.4:0/dw-apb-uart.4:0.0/power/control
> 
> If the touchscreen controller driver(s) are using serdev they are
> children of the dw-apb-uart.4:0.0 and can use runtime PM calls to
> block the parent device from idling as necessary. The hierarchy
> unless changed using ignore_children.

Sorry about all the typos, I meant "the hierarchy works unless changed"
above. The rest of the typos are easier to decipher probably :)

Regards,

Tony
