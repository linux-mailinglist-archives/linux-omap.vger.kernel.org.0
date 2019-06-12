Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46B9642B54
	for <lists+linux-omap@lfdr.de>; Wed, 12 Jun 2019 17:56:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729872AbfFLP4J (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 12 Jun 2019 11:56:09 -0400
Received: from mail-qt1-f176.google.com ([209.85.160.176]:39467 "EHLO
        mail-qt1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729861AbfFLP4J (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 12 Jun 2019 11:56:09 -0400
Received: by mail-qt1-f176.google.com with SMTP id i34so19031526qta.6
        for <linux-omap@vger.kernel.org>; Wed, 12 Jun 2019 08:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=0AhW1jqIHEEtfEVda49sOgcatgOyt/WdTDxj6pvRHrw=;
        b=TuxhhNXxgbDPDKm6QR9VZF5QDLGH2DNdaoYJBG5AYSX8YXWxCzWHHfOn73FbxJKCqz
         6MbAh4obw7KR1SKMXGWtofrRPZuqkYtOzdVP6A2gTXp8T3JoYQD0/43/+L9PfeNjyzZQ
         9bejuZQPnDrK/SLhxccqhACAXn+/30ZlJbc9fHbV+mswWkRLFBP7LYFGSapZprcYD/tg
         LmWYhsfv6XJ8m/fjs1IbZtEBVHnNFc7D77TOmLhGIR1Z+XlQO/73yZjBufU7t1KSNtr8
         SAAC4tWxnJPkT8EA3OMyc6ghh0jjXtZi+GDSK2IbagXvzoZfNYJnF7a6nLl3nxhBm/+M
         Dnyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=0AhW1jqIHEEtfEVda49sOgcatgOyt/WdTDxj6pvRHrw=;
        b=I276Fkj1w9v2gzgk2/CKJiFWwJkEnhiBErtO7v1Dztea+ywGELVcbzURYiZUxonrPG
         cJv37UVp+qR7BFLkDkc9SQ8JEWB8JpW/vKgHiJki1RF7G8ukdSszU7cBfmMzWizX0Joy
         ZekCDbAKxD2HcSu9x/rKzOvN+lZc8W8G+k402UNiM2o5jPHg8PuL0aFra/iUWvf89R71
         1JATctLm/+o50MxC2EJ2PcXod6sa6yAmOKOIFA/UlfgIhllLE/FtEJnsDFmYKtcpjpFQ
         qGv9gphG6X0LqnBfWSwt2DWXHAqWgfzDv+joCa1OdzfNfdVWfD0wXJY0XCZrSd5hT2bI
         jZ+Q==
X-Gm-Message-State: APjAAAUpFjpd2Vt879fhuUDJPaqPB/4q94ZbDTq6B4KsVyXiIKPS7jrT
        fuK3Gp84aOWEx6sKyascmpt4xcTG9f6C26h8Px4870Pp
X-Google-Smtp-Source: APXvYqyAfEOTdmGmy/yqpriARYmt6uV5jSdhGlrVXMAMGmfCGSgBf98TmAwBCj4tIw6AvVgcqxdFbbYxNq1dP88gCO8=
X-Received: by 2002:ac8:5294:: with SMTP id s20mr5961083qtn.279.1560354968358;
 Wed, 12 Jun 2019 08:56:08 -0700 (PDT)
MIME-Version: 1.0
From:   Pratim Ugale <pratim.ugale@gmail.com>
Date:   Wed, 12 Jun 2019 21:25:58 +0530
Message-ID: <CA+xR38=+qvQtHvtUq8zoi5nTA_=LTtYt574w2zLTJb9CuiSPBQ@mail.gmail.com>
Subject: Project Announcement of an updated PRU User Space API under BeagleBoard.org
To:     linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hello,

My name is Pratim Ugale and I will be developing Open Source Code for
BeagleBoard.org as a student of Google Summer of Code (GSoC) 2019. I
got this email from Mr. Jason Kridner, he said that an announcement
was needed regarding what I'll be working on.

The project will involve making updated bindings/API for controlling
the PRUs using the RemoteProc, RPMsg drivers. (In earlier projects
like 'PyPRUSS', the UIO driver was being used) It will provide an easy
to use interface for loading firmware, controlling execution and
interrupts/memory management for the PRUs, therefore shortening the
learning curve for users new to PRU programming and also allowing
seamless integration of PRU functionality to larger projects.

The project code will mostly be in the userspace-only, a kernel module
will also be needed for a dedicated driver-probing-id, for the rpmsgs
when using the APIs.

Please let me know if there are any suggestions, features that you
would like me to include to make the project more efficient.

Regards,

Pratim Ugale.
