Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6EDABB5FC
	for <lists+linux-omap@lfdr.de>; Mon, 23 Sep 2019 15:59:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405939AbfIWN72 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 23 Sep 2019 09:59:28 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:41206 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406093AbfIWN71 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 23 Sep 2019 09:59:27 -0400
Received: by mail-io1-f67.google.com with SMTP id r26so33564083ioh.8;
        Mon, 23 Sep 2019 06:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=TWgZDntOMYE0pJNm4v4MgMyLm0itzJK9E74UOUCbCFE=;
        b=B6+Apv1RJdQ37kPuvdWmbO89qv/PsqiCAo0SHwzGcoxdyvfEqfwzhWz1meFjdy5Qmy
         FleS6wpU7zVYpcZ+YfcRFuKwacSpdwFFZisI3SHNVLViCulRlqARzzNs2SUuUsaLSQUl
         4uflfyrUNRCdxIo7WqfLV8eCpoUEKQio8eriblIs2B3fyAqVvW5UxHXOHNHk9uU5nkox
         H8IJRYlEx4N9UMwDqs3Y9+abnO4HyZIoWBfDueK0BDOkGxcMSM+dQJSYkhPb0UR2WTqz
         +XP6r5K7iU5aB2pJk3ZsIq/yzaOTQ94h3qTCj5MzKYqXmiahKMl50AunGqWhyHEeZW+m
         Eiqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=TWgZDntOMYE0pJNm4v4MgMyLm0itzJK9E74UOUCbCFE=;
        b=Jb4qrETBxHGIlV5HdIPG1gg1mbk5UBcCvqvxcUwQ1QyRynL6l1pl6DYvAtQDGCIl6c
         gOF+HWQ3yUeQAXDkbGX0XjYHH6xtuVtYHOdXKFN9iL+eiZK68dBylkEzj76mSeukoFkZ
         eFNaZ+mJoAC96s9jqaVH/fvq6gc8Yg3r7YmSCU0x/Yqw6Bs5I5HAieyyfjkxm9OB+/zu
         zNq/SSYnqKoNid65hSxVuXhv/YsPDG4XxfwaLY3Fwzg2zkF7OAVrCWiGgk6WWmQ6wbJA
         GhIy9BbWPJwKB3U376FzdSfLqSfiXwm3FU2PeNo5UYuLwSH7jiBu1o55YD4Pysw+akHA
         p6Ag==
X-Gm-Message-State: APjAAAVXhRMvwiSyGewH1SaJHQZI0WmdHgMmMS3ZejDXwc0CKLs6ckR/
        4LRHRlQQ6kcauYsT5x+Pvy5PsFDi1g8=
X-Google-Smtp-Source: APXvYqzI3T+bagBhR2MF2H7ERsE6p1dgAN3VtZkGUyom8CDjGxaFnduVlvnhZcEySEGl1KbkJnnSOg==
X-Received: by 2002:a6b:e507:: with SMTP id y7mr30970192ioc.264.1569247166121;
        Mon, 23 Sep 2019 06:59:26 -0700 (PDT)
Received: from aford-OptiPlex-7050.logicpd.com ([174.46.170.158])
        by smtp.gmail.com with ESMTPSA id j11sm7917262ioa.55.2019.09.23.06.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2019 06:59:25 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-omap@vger.kernel.org, Adam Ford <aford173@gmail.com>
Subject: [PATCH] MAINTAINERS: Add logicpd-som-lv and logicpd-torpedo to OMAP TREE
Date:   Mon, 23 Sep 2019 08:59:06 -0500
Message-Id: <20190923135908.23080-1-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The OMAP DEVICE TREE SUPPORT lists a bunch of device tree files
with wildcard names using am3*, am4*, am5*, dra7*, and *omap*.
Unfortunately, the LogicPD boards do not follow this convention
so changes to these boards don't get automatically flagged to
route to the omap mailing list.  After consulting with Tony
Lindgren, he agreed it made sense to add these boards to the
list.

This patch adds the omap based boards to the omap device tree
maintainer list.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/MAINTAINERS b/MAINTAINERS
index a50e97a63bc8..0ee89575699c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11645,6 +11645,8 @@ F:	arch/arm/boot/dts/*am3*
 F:	arch/arm/boot/dts/*am4*
 F:	arch/arm/boot/dts/*am5*
 F:	arch/arm/boot/dts/*dra7*
+F:	arch/arm/boot/dts/logicpd-som-lv*
+F:	arch/arm/boot/dts/logicpd-torpedo*
 
 OMAP DISPLAY SUBSYSTEM and FRAMEBUFFER SUPPORT (DSS2)
 L:	linux-omap@vger.kernel.org
-- 
2.17.1

