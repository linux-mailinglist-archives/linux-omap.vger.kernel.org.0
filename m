Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAAF26A5408
	for <lists+linux-omap@lfdr.de>; Tue, 28 Feb 2023 09:01:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230430AbjB1IBH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 Feb 2023 03:01:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230249AbjB1IA3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 28 Feb 2023 03:00:29 -0500
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFACD2C643
        for <linux-omap@vger.kernel.org>; Tue, 28 Feb 2023 00:00:11 -0800 (PST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-536af432ee5so249657937b3.0
        for <linux-omap@vger.kernel.org>; Tue, 28 Feb 2023 00:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tHYax+79/7KD9mgzANO2cU0qDWMCaiZzX5GSj5yb/Mk=;
        b=UpTYF8BGRFmqxjuG03YEwfWURxE3yO0p/s8TlfgVerisxioiAIEAzDBbspw9Nr0vMB
         6A9/QJqoKxL95uauijZap+d1xpYJIH9kR0n9azaAxN1xT82ukWyse+5GU1gGH1FBpocP
         HKTPiCRbjJJQOPzu08Kt6gbzSgntU4In/tkS1K14Z13LPv6SQbMGdJEMmuHwzZfxWgfY
         bxd8cC0RE6+Nyfbuyzt8UZde1iuSmCj8ci3YdEydCZxRa+MLmPRhX2GDaYiw0uL9hOJY
         /Nj1ENwJZtgRIm6BZKoMR9gfHMoKHuaQ6NA6hsdh8XxWhG0Xj97zh3KLm4Ebd+VhzwCK
         6AAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tHYax+79/7KD9mgzANO2cU0qDWMCaiZzX5GSj5yb/Mk=;
        b=0kCU4w450EXnbim7InsKHDLaZZ/BdT3xyylIaEPYiypMxeGTE4LBP9F+g2DAhlZyJC
         wsj3LZFi/9rx0DKzLyInoBpRv4/ZSlFUBpE1zjUEqSWdGsSN5Rr2zNWW3HuPppbYJ7R0
         hWvarvc7Qc0zWs/Da0v91wFoSqsWlnWDw+SlR6BmsQ6Q/0x+nGd5TM3wpe3L/94ynspO
         L77UmGr6fO/DjzLXqmJDKpz4oewiwvdXqVB78vRNzqP1EYM/fB7pYy/B2AHD8T3FO+RG
         aRn3+y5wSjynlkZpZT1juSOmNbczfSShqX7bPIXIetIhDXbx4tkLhsztydvjy8ntGP8y
         FPSA==
X-Gm-Message-State: AO0yUKUdsZqb7MxdG1cgm3yJUScEhUqFbkanh0oP+5feRiMPpomt6brU
        e6thKEqtrxglNliaVfvPzt1nvlN8RB1n3lwBVjVIpd/tuC0=
X-Google-Smtp-Source: AK7set/9D7H+t/N+YSYMBhnIPT7iU/NqGPuMbaqPwWsYAxTudEkwyjNM4QjaL91dapje1hCKlzeqAKTJMdr6rZCTI6A=
X-Received: by 2002:a81:b612:0:b0:533:8080:16ee with SMTP id
 u18-20020a81b612000000b00533808016eemr1037225ywh.10.1677571210280; Tue, 28
 Feb 2023 00:00:10 -0800 (PST)
MIME-Version: 1.0
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Tue, 28 Feb 2023 08:59:59 +0100
Message-ID: <CAGm1_kuc0T5xqdQU0JVbetz+pMZb2=v=jhpgmfvZQhAiPdAG=A@mail.gmail.com>
Subject: am335x: performnce issues with FTDI and LOW_LATENCY
To:     Linux-OMAP <linux-omap@vger.kernel.org>
Cc:     Bin Liu <b-liu@ti.com>, Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

I have the same am335x-based system running with both 3.18.x and 5.4.x
(6.2.1 too) kernels. In the full setup the system handles 4x FT4232-H
chips.

# lsusb -t
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=musb-hdrc/1p, 480M
    |__ Port 1: Dev 2, If 0, Class=, Driver=hub/4p, 480M
        |__ Port 2: Dev 3, If 0, Class=, Driver=ftdi_sio, 480M
        |__ Port 2: Dev 3, If 1, Class=, Driver=ftdi_sio, 480M
        |__ Port 2: Dev 3, If 2, Class=, Driver=ftdi_sio, 480M
        |__ Port 2: Dev 3, If 3, Class=, Driver=ftdi_sio, 480M
        |__ Port 3: Dev 4, If 1, Class=, Driver=ftdi_sio, 480M
        |__ Port 3: Dev 4, If 2, Class=, Driver=ftdi_sio, 480M
        |__ Port 3: Dev 4, If 0, Class=, Driver=ftdi_sio, 480M
        |__ Port 3: Dev 4, If 3, Class=, Driver=ftdi_sio, 480M
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=musb-hdrc/1p, 480M
    |__ Port 1: Dev 2, If 0, Class=, Driver=hub/4p, 480M
        |__ Port 2: Dev 3, If 0, Class=, Driver=ftdi_sio, 480M
        |__ Port 2: Dev 3, If 3, Class=, Driver=ftdi_sio, 480M
        |__ Port 2: Dev 3, If 1, Class=, Driver=ftdi_sio, 480M
        |__ Port 2: Dev 3, If 2, Class=, Driver=ftdi_sio, 480M
        |__ Port 3: Dev 4, If 0, Class=, Driver=ftdi_sio, 480M
        |__ Port 3: Dev 4, If 1, Class=, Driver=ftdi_sio, 480M
        |__ Port 3: Dev 4, If 2, Class=, Driver=ftdi_sio, 480M
        |__ Port 3: Dev 4, If 3, Class=, Driver=ftdi_sio, 480M

When I open all 16 serial ports with the LOW_LATENCY flag in the
latest kernels, the system performance drops dramatically. It is best
to watch via iperf3:

Kernel 6.2.1
16 serial ports closed: 90.2 Mbits/sec
16 serial ports opened without LOW_LATENCY: 88.3 Mbits/sec
16 serial ports opened with LOW_LATENCY: 12.1 Mbits/sec

Kernel: 3.18.1
16 serial ports closed: 61.1 Mbits/sec
16 serial ports opened without LOW_LATENCY: 53.7 Mbits/sec
16 serial ports opened with LOW_LATENCY: 37.2 Mbits/sec

Any idea why the performance drop is so big?

Regards,
Yegor
