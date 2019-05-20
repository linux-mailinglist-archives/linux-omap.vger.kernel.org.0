Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77879240D5
	for <lists+linux-omap@lfdr.de>; Mon, 20 May 2019 21:05:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726011AbfETTFh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 20 May 2019 15:05:37 -0400
Received: from mail-wr1-f50.google.com ([209.85.221.50]:41270 "EHLO
        mail-wr1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726010AbfETTFh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 20 May 2019 15:05:37 -0400
Received: by mail-wr1-f50.google.com with SMTP id g12so15531652wro.8
        for <linux-omap@vger.kernel.org>; Mon, 20 May 2019 12:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=/wBgxFqIYmxVjOICVhiMhej/rs9vVKrtLIN4IKZUwoU=;
        b=pz05wJ43cdxIiaMp7aFHfg2PYPtBTkbKpXwweXg1ABx/Cq2ffs3fkG9H667h3VFz6Y
         DLbEj86cMvNZJ2SXxMQ3atjvPzfyHlBDd2yQiEyAIM8+g3WwKw3q+YjxQ7pGIXmBAyVs
         yCvHHyZYz1K2712MinYlAMK4HtGLtAv/WmrNVffzc7dRafZbS8SHuntdU1zae3LjwvLd
         5K0OLwC/Ta0gntR8LUDWTgAupQb+XmAwpWSEk/d7TQldBE3p9tesGI/Cl9HiE/wURNZF
         bGYAp3juXwAjhZKwNclGLsjSA6BoFgBqE8YDwNeMh4HBGjUprX9LtD8gC4+LCnDihB8C
         Dvyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=/wBgxFqIYmxVjOICVhiMhej/rs9vVKrtLIN4IKZUwoU=;
        b=lpQFrdMPOIcoJ1b3feh8/WDB1oRZ9Y54cOKgr2+89qjG2Z2C2rHjGr1fnhT3NirHq4
         ug6s5z1ToXjBl8vYgsEde2l6n+2Z+gLDXwf548mKO9ogGUYnzy6NYx63HVci6tWK+Znd
         sdLucJ78TFxpTmGHmi9sasMwJhJzkrL05/Yz6H1LtS9hLUyWdo/0PZJVcRATAXj3ApFy
         FXYZ7Iwn22X14q10H232Mzh82F/E60bRJyy4TK/MSQPTaW2zd0TV9Exebum2OrqCRbO2
         HgLz2Q0NbqYMX1iENWiUBFTZnEJk+3x84Z3A46ijGst7SATyxeOGAj/wUwbcCR9PErQW
         fKHw==
X-Gm-Message-State: APjAAAXIUU5luDSGXCe84klIu2VE65WNDU+T2Xjg5jyNVB4OgzftFyWi
        WhMZq/rcAjdx6eXXx7+XrhFXIh3b
X-Google-Smtp-Source: APXvYqyY8p2WgIyMs5eCVadhRwAfNI1gozXpqIxOBLbOHWijWZcqmutPVykDNt/i49QK1QX+vg6MsQ==
X-Received: by 2002:a5d:4647:: with SMTP id j7mr11891319wrs.280.1558379135879;
        Mon, 20 May 2019 12:05:35 -0700 (PDT)
Received: from Red ([2a01:cb1d:147:7200:2e56:dcff:fed2:c6d6])
        by smtp.googlemail.com with ESMTPSA id j28sm29042150wrd.64.2019.05.20.12.05.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2019 12:05:35 -0700 (PDT)
Date:   Mon, 20 May 2019 21:05:33 +0200
From:   Corentin Labbe <clabbe.montjoie@gmail.com>
To:     linux-omap@vger.kernel.org, qemu-devel@nongnu.org
Subject: Running linux on qemu omap
Message-ID: <20190520190533.GA28160@Red>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hello

I am working on adding a maximum set of qemu machine on kernelCI.

For OMAP, five machine exists and I fail to boot any of them.
The maximum I can get with omap1_defconfig is
qemu-system-arm -kernel zImage -nographic -machine cheetah -append 'root=/dev/ram0 console=ttyO0'
Uncompressing Linux... done, booting the kernel.
then nothing more.

Does someone have a working config+version to share ?

Thanks
Regards
